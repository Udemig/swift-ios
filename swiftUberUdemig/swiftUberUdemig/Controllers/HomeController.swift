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
    
    private var actionButtonConfig = ActionButtonConfiguration()
    
    weak var delegate: HomeControllerDelegate?
    private let mapView = MKMapView()
    private let locationManager = LocationHandler.shared.locationManager
    private let inputActivationView = LocationInputActivationView()
    private let rideActionView = RideActionView()
    private let locationInputView = LocationInputView()
    private let tableView = UITableView()
    
    var user:User? {
        didSet{
            //fonksiyonleri cagir
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
