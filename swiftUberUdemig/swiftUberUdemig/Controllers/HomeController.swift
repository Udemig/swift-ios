//
//  HomeViewController.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 9.02.2025.
//

import UIKit
import FirebaseDatabase
import MapKit


private let reuseIdentifier = "LocationCell"
private let annotationIdentifier = "DriverAnnotation"

private enum ActionButtonConfiguration {
    case showMenu
    case dissmissActionView
    
    init() {
        self = .showMenu
    }
}

private enum AnnotationType: String {
    case pickup
    case destination
}

protocol HomeControllerDelegate: AnyObject {
    func handleMenuToggle()
}

class HomeController: UIViewController {

    //MARK: -properties
    
    
    private let mapView = MKMapView()
    private let locationManager = LocationHandler.shared.locationManager
    private let inputActivationView = LocationInputActivationView()
    private let rideActionView = RideActionView()
    private let locationInputView = LocationInputView()
    private let tableView = UITableView()
    private let searchResults  = [MKPlacemark]()
    private let savedLocations = [MKPlacemark]()
    private final let locationInputViewHeight: CGFloat = 200
    private final let rideActionViewHeight: CGFloat = 300
    private var actionButtonConfig = ActionButtonConfiguration()
    private var route: MKRoute?
    
    weak var delegate: HomeControllerDelegate?

    var user:User? {
        didSet{
            locationInputView.user = user
            
            if user?.accountType == .passenger{
                fetchDrivers()
                configureLocationInputActivationView()
                
                //fonksiyonlari cagir
            } else {
                //observe et
            }
        }
    }
    
    private var trip: Trip? {
        didSet {
            //
        }
    }
  
    
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         configureUI()
        // Do any additional setup after loading the view.
    }
    
    func fetchDrivers() {
        guard let location = locationManager?.location else {
            return
        }
        PassengerService.shared.fetchDriver(location: location) { driver in
            guard let coordinate = driver.location?.coordinate else { return }
            let annotation = DriverAnnotation(coordinate: coordinate, uid: driver.uid)
            
            var driverIsVisible: Bool {
                return self.mapView.annotations.contains { annnotation in
                    guard let driverAnno = annotation as? DriverAnnotation else {
                        return false
                    }
                    
                    if driverAnno.uid == driver.uid {
                        
                        driverAnno.updateaAnnotationPosition(withCoordinate: coordinate)
                        //yaklastirma yap
                        return true
                    }
                    return false
                
                }
            }
            
            if !driverIsVisible {
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    func zoomForActiveTrip(withDriverUid uid: String) {
        var annotations = [MKAnnotation]()
        
        self.mapView.annotations.forEach { annotation in
            if let anno = annotation as? DriverAnnotation{
                if anno.uid == uid {
                    annotations.append(anno)
                }
            }
            if let userAnno = annotation as? MKUserLocation {
                annotations.append(userAnno)
            }
        }
        
        self.mapView.zoomToFit(annotations: annotations)
    }
    
    func configureLocationInputActivationView() {
        view.addSubview(inputActivationView)
        inputActivationView.centerX(inView: view)
        inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationView.anchor(top: actionButton.bottomAnchor, paddingTop: 32)
        inputActivationView.alpha = 0
        inputActivationView.delegate = self
        
        UIView.animate(withDuration: 2) {
            self.inputActivationView.alpha = 1
        }
    }
    
    
    func configureLocationInputView(){
        locationInputView.delegate = self
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: locationInputViewHeight)
        locationInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.locationInputView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.tableView.frame.origin.y = self.locationInputViewHeight
            }
        }

    }
    
    func observeCurrentTrip()  {
        PassengerService.shared.observerCurrentTrip { trip in
            self.trip = trip
            guard let state = trip.state else { return }
            guard let driverUid = trip.driverUid else { return }
            
            switch state {
            case .requested:
                break
            case .denied:
                //yukleme durumu goster
                break
            case .accepted:
                break
            case .driverArrived:
                break
            case .inProgress:
                break
            case .arrivedAtDestination:
                break
            case .completed:
                break
            }
        }
    }
    
    //MARK: -Selectors
    @objc func actionButtonPressed() {
        switch actionButtonConfig {
        case .showMenu:
            delegate?.handleMenuToggle()
        case .dissmissActionView:
            //anotasyonu kaldir
            delegate?.handleMenuToggle()
        }
    }
    
    fileprivate func configureActionButton(config: ActionButtonConfiguration){
        switch config {
        case .showMenu:
            self.actionButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
            self.actionButtonConfig = .showMenu
        case .dissmissActionView:
            self.actionButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            self.actionButtonConfig = .dissmissActionView
        }
    }
    
    func configureUI() {
        configureMapView()
        configureRideActionView()
        
        view.addSubview(actionButton)
        actionButton.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 20, width: 30, height: 30)
        
        configureTableView()
    }
    
    func configureMapView() {
        
    }
    
    func configureRideActionView() {
        
    }
    
    func configureTableView() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HomeController: LocationInputActivationViewDelegate{
    func presentLocationInputView() {
        inputActivationView.alpha  = 0
        configureLocationInputView()
    }
}

extension HomeController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        
    }
    
    func executeSearch(with query: String) {
        
    }
}
