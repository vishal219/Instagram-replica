//
//  LoginViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit
import SafariServices
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        usernameField.delegate = self
        passwordField.delegate = self
        
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        CreateUserButton.addTarget(self, action: #selector((didTapCreateUser)), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
    }
    
    struct Constants {
        static let cornerRadius = 8.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email ...."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password ...."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius =  Constants.cornerRadius
        return button
    }()
    
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()

    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let CreateUserButton : UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius =  Constants.cornerRadius
        return button
    }()
    
    private let headerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gradient"))
        view.addSubview(backgroundImage)
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Assign frames
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        
        usernameField.frame = CGRect(x: 25.0,
                                     y: headerView.bottom + 40,
                                     width: view.width - 50.0,
                                     height: 52.0)
        
        passwordField.frame = CGRect(x: 25.0,
                                     y: usernameField.bottom + 10,
                                     width: view.width - 50.0,
                                     height: 52.0)
        
        loginButton.frame = CGRect(x: 25.0,
                                     y: passwordField.bottom + 10,
                                     width: view.width - 50.0,
                                     height: 52.0)
        
        CreateUserButton.frame = CGRect(x: 25.0,
                                     y: loginButton.bottom + 10,
                                     width: view.width - 50.0,
                                     height: 52.0)
        
        privacyButton.frame = CGRect(x: 10.0,
                                     y: view.height - view.safeAreaInsets.bottom - 50,
                                     width: view.width - 50.0,
                                     height: 50.0)
        termsButton.frame = CGRect(x: 10.0,
                                   y:view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 50.0,
                                   height: 50.0)
        
        
        configureHeaderView()
    }
    
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard var background = headerView.subviews.first else{
            return
        }
        background.frame = headerView.bounds
        
        // Adding Logo
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
        headerView.addSubview(logo)
    }
    private func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(CreateUserButton)
        view.addSubview(headerView)
    }
    
    @objc func didTapLogin() {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let userNameEmail = usernameField.text, !userNameEmail.isEmpty, let password = passwordField.text, !password.isEmpty,password.count <= 8 else{
            return
        }
        
        //Log In user
    }
    
    @objc func didTapCreateUser() {
        let vc = RegisterationViewController()
        present(vc, animated: true)
    }
    
    @objc func didTapTerms() {
        guard let url = URL.init(string: "https://help.instagram.com/581066165581870") else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc,animated: true)
    }
    
    @objc func didTapPrivacy() {
        guard let url = URL.init(string: "https://help.instagram.com/519522125107875") else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc,animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLogin()
        }
        
        
        return true
    }
}
