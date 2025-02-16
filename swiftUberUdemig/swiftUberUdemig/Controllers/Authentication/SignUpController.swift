//
//  SignUpViewController.swift
//  swiftUberUdemig
//
//  Created by Mehmet Seyhan on 9.02.2025.
//

import UIKit
import FirebaseAuth
import GeoFire

class SignUpController: UIViewController {
    
    //MARK: -Properties
    private var location = LocationHandler.shared.locationManager.location
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UDEMIG UBER"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()

    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let fullnameTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "fullname", isSecureTextEntry: false)
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "person.crop.circle")!, textField: fullnameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    
    
    //eklendi
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return view
        }()
    
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Sifre", isSecureTextEntry: true)
    }()
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Musteri","Surucu"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "person")!, segmentControl:  accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private let signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Kayit Ol", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Zaten bir hesabim var", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
       // view.backgroundColor = .blue

        // Do any additional setup after loading the view.
    }
    
   
    
    //MARK: -Selector
    @objc func handleSignUp(){
        guard let email = emailTextField.text else { return }
        guard let passord = passwordTextField.text else { return }
        guard let fullname = fullnameTextField.text else { return }
        
        let accountTypeIndex = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: passord) { authResult, error in
            if let error = error {
                print("Failed to create user: \(error.localizedDescription)")
                return
            }
            
            guard let uid = authResult?.user.uid else { return }
            
            let values: [String: Any] = [
                "email": email,
                "fullname": fullname,
                "accountType": accountTypeIndex
            ] as [String : Any]
            if accountTypeIndex == 1 {
                let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
                guard let location = self.location else { return }
                geofire.setLocation(location, forKey: uid) { error in
                    self.uploadUserDataAndShowHomeController(uid: uid, values: values)
                }
            }
            self.uploadUserDataAndShowHomeController(uid: uid, values: values)
            
            
                }
        
    }
    
    func uploadUserDataAndShowHomeController(uid: String, values: [String: Any]) {
        REF_USERS.child(uid).updateChildValues(values) { error, databaseReference in
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first, let controller = window.rootViewController as? ContainerController else { return }
            
            //yonlendirme yapacagiz
            controller.configure()
            
            self.dismiss(animated: true)
        }
        
    }
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: -Functions
    func configureUI() {
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   fullNameContainerView,
                                                   passwordContainerView, accountTypeContainerView, signUpButton])
        
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16,
                     paddingRight:  16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
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
