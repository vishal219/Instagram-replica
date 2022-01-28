//
//  LoginViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    private let usernameField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton : UIButton = {
        return UIButton()
    }()
    
    private let termsButton : UIButton = {
        return UIButton()
    }()

    private let privacyButton : UIButton = {
        return UIButton()
    }()
    
    private let CreateUserButton : UIButton = {
        return UIButton()
    }()
    
    private let headerView : UIView = {
        return UIView()
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Assign frames
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
    
    @objc func didTapLogin() {}
    
    @objc func didTapCreateUser() {}
    
    @objc func didTapTerms() {}
    
    @objc func didTapPrivacy() {}
}
