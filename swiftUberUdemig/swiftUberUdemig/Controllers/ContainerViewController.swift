//
//  ContainerViewController.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 9.02.2025.
//

import UIKit
import FirebaseAuth

class ContainerViewController: UIViewController {

    //MARK: - properties
    
    private let homeController = HomeViewController()
    private var menuController: MenuViewController!// degistirecegim
    private var isExpanded = false
    private let blackView = UIView()
    private lazy var xOrigin = self.view.frame.width - 80
    
    private var user: User? {
        didSet{
            guard let user = user else { return }
            
            //home controller user atama yap
            
            //menu configure et
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkIfUserIsLoggedIn()
        
    }
    
    
    func checkIfUserIsLoggedIn() {
      if Auth.auth().currentUser?.uid == nil {
            presentLoginController()
        } else{
            configure()
        }
        
    }
    
    
    func configure() {
        view.backgroundColor = .backgroundColor
        configureHomeController()
        fetchUserData()
    }
    
    func configureHomeController() {
        addChild(homeController)
        homeController.didMove(toParent: self)
        view.addSubview(homeController.view)
        //delegate eklememiz lazim
    }
    
    func configureMenuController(withUser user: User) {
        menuController = MenuViewController(user: user)
        addChild(menuController)
        menuController.didMove(toParent: self)
        view.insertSubview(menuController.view, at: 0)
        menuController.delegate = self
        configureBlackView()
    }
    
    func configureBlackView(){
        self.blackView.frame = CGRect(x: xOrigin, y: 0, width: 80, height: self.view.frame.height)
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.alpha = 0
        view.addSubview(blackView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        blackView.addGestureRecognizer(tap)
    }
    
    @objc func dismissMenu(){
        isExpanded = false
        animateMenu(shouldExpand: isExpanded)
    }
    
    func animateMenu(shouldExpand: Bool, completion: ((Bool) -> Void)? = nil) {
        //animasyon yapacagiz
    }
    
    func fetchUserData() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        Service.shared.fetchUserData(uid: currentUid) { user in
            self.user = user
        }
        
        
    }
    func presentLoginController() {
        DispatchQueue.main.async {
            let nav = UINavigationController(rootViewController: LoginViewController())
            self.isModalInPresentation = true
            self.present(nav, animated: true)
        }
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


//MARK: - MenuControllerDelegate

extension ContainerViewController: MenuControllerDelegate{
    func didSelect(option: MenuOptions) {
        
    }
}
