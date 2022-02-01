//
//  RegisterationViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit

class RegisterationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius = 8.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username...."
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
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email...."
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
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius =  Constants.cornerRadius
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        addSubviews()
        
        usernameField.delegate = self
        passwordField.delegate = self
        emailField.delegate = self
    }
    
    private func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Assign frames
        
        usernameField.frame = CGRect(x: 20.0,
                                     y: view.safeAreaInsets.top + 100,
                                     width: view.width - 40,
                                     height: 52.0)
        
        
        emailField.frame = CGRect(x: 20.0,
                                  y: usernameField.bottom + 10,
                                  width: view.width - 40,
                                  height: 52.0)
        
        passwordField.frame = CGRect(x: 20.0,
                                     y: emailField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52.0)
        
        signUpButton.frame = CGRect(x: 20.0,
                                    y: passwordField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52.0)
    }
    
    @objc func didTapSignIn(){
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
                let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else{
                  return
              }
        
        AuthManager.shared.registerUser(userName: username, email: email, password: password){ registered in
            DispatchQueue.main.async {
                if registered{
                    //sucessfully registered
                }
                else{
                    //Error registering
                }
            }
        }
    }
}

extension RegisterationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else{
            didTapSignIn()
        }
        return true
    }
}
