//
//  ContainerViewController.swift
//  uberUdemig
//
//  Created by Mehmet Seyhan on 21.12.2024.
//

import UIKit

class ContainerViewController: UIViewController {
    
    /*
     
     private let homeController = HomeViewController()
     
     private var user: User? {
         didSet {
             guard let user = user else {return}
             homeController.user = user
             //ayarlama yap
         }
     }
     
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        // Do any additional setup after loading the view.
    }
    
    
    func checkIfUserIsLoggedIn(){
        presentLoginController()
        /*
        if Auth.auth().currentUser.uid == nil {
            presentLoginController()
        } else{
            configure()
        }
         */
    }
    
    func presentLoginController() {
        DispatchQueue.main.async{
            let nav = UINavigationController(rootViewController: LoginViewController())
            nav.isModalInPresentation = true
            self.present(nav, animated: true)
        }
    }
    
    func configure(){
        view.backgroundColor = .backgroundColor
        //home ivew ayar
        //verileri cek
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
