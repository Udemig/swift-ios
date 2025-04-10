//
//  Service.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 15.02.2025.
//

import Foundation
import FirebaseDatabase
import CoreLocation
import GeoFire
import FirebaseAuth



//MARK: - database ref
let DB_REF = Database.database(url: "https://swiftuberudemig-default-rtdb.firebaseio.com/").reference()

let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")
let REF_TRIPS = DB_REF.child("trips")

//MARK: - SharedService
struct Service {
    static let shared = Service()
    
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { dataSnapshot in
            guard let dictionary = dataSnapshot.value as? [String: Any] else { return }
            let uid = dataSnapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}

//MARK: -DriverService

struct DriverService{
    static let shared = DriverService()
    
    func observerTrip(completion: @escaping(Trip)-> Void){
          REF_TRIPS.observe(.childAdded) { dataSnapshot in
              guard let dictionary = dataSnapshot.value as? [String: Any] else {
                  return
              }
              let uid = dataSnapshot.key
              let trip = Trip(passengerUid: uid, dictionary: dictionary)
              completion(trip)
          }
      }
    
    func observeTripCancelled(trip: Trip, completion: @escaping() -> Void) {
        REF_TRIPS.child(trip.passengerUid).observeSingleEvent(of: .childRemoved) { dataSnaphot in
            completion()
        }
    }
    
    func acceptTrip(trip: Trip, completion: @escaping(Error?, DatabaseReference)-> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = ["driverUid": uid,
                      "state": TripState.accepted.rawValue] as [String: Any]
        
        REF_TRIPS.child(trip.passengerUid).updateChildValues(values, withCompletionBlock: completion)
    }
    
    func updateTripState(trip: Trip, state: TripState, completion: @escaping(Error?, DatabaseReference) -> Void) {
        REF_TRIPS.child(trip.passengerUid).child("state").setValue(state.rawValue, withCompletionBlock: completion)
        
        if state == .completed{
            REF_TRIPS.child(trip.passengerUid).removeAllObservers()
        }
    }
    
    func updateDriverLocation(location: CLLocation) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        geofire.setLocation(location, forKey: uid)
    }
}

//MARK: -PassengerService
struct PassengerService {
    static let shared = PassengerService()
    
    func fetchDriver(location: CLLocation, completion: @escaping(User) -> Void) {
        let geoFire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        
        REF_DRIVER_LOCATIONS.observe(.value) { dataSnaphot in
            geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { uid, location in
                Service.shared.fetchUserData(uid: uid) { user in
                    var driver = user
                    driver.location = location
                    completion(driver)
                }
            })
        }
    }
    
    func uploadTrip(_ pickupCoordinates: CLLocationCoordinate2D, destinationCoordinates: CLLocationCoordinate2D, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let pickupArray = [pickupCoordinates.latitude, pickupCoordinates.longitude]
        let destinationArray = [destinationCoordinates.latitude, destinationCoordinates.longitude]
        
        let values = ["pickupCoordinates": pickupArray,
                      "destinationCoordinates": destinationArray,
                      "state": TripState.requested.rawValue] as [String: Any]
        
        REF_TRIPS.child(uid).updateChildValues(values, withCompletionBlock: completion)
    }
    
    func observerCurrentTrip(completion: @escaping(Trip) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_TRIPS.child(uid).observe(.value) { dataSnapshot in
            guard let dictionary = dataSnapshot.value as? [String: Any] else {
                return
            }
            let uid = dataSnapshot.key
            let trip = Trip(passengerUid: uid, dictionary: dictionary)
            completion(trip)
        }
    }
    
    func deleteTrip(completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        REF_TRIPS.child(uid).removeValue(completionBlock: completion)
    }
    
    func saveLocation(locationString: String, type: LocationType, completion: @escaping(Error?, DatabaseReference) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let key: String = type == .home ? "homeLocation" : "workLocation"
        REF_USERS.child(uid).child(key).setValue(locationString, withCompletionBlock: completion)
    }
    
    
}
