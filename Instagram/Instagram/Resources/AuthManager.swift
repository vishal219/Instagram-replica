//
//  RequestManager.swift
//  Instagram
//
//  Created by vishalthakur on 28/01/22.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    //MARK: - Public
    
    public func registerUser(userName: String,email: String,password: String,completion: @escaping (Bool) -> Void){
        /*
         - check if username is available
         - check if email is available
         */
        
        DatabaseManager.shared.canCreateUser(userName: userName, email: email){ available in
            if available{
                /*
                 - create Account
                 - Insert inot database
                 */
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    guard result != nil, error == nil else {
                        return
                    }
                    
                    //Insert into database
                    
                    DatabaseManager.shared.insertNewUser(userName: userName, email: email){ inserted in
                        if inserted{
                            //Inserted sucessfully
                            completion(true)
                            return
                        }
                        else{
                            //error inserting
                            completion(false)
                            return
                        }
                    }
                }
            }
            else{
                // email or username already exists
            }
        }
    }
    
    public func loginUser(userName: String?,email: String?,password: String,completion : @escaping (Bool) -> Void){
        if let email = email{
            // Email login
            Auth.auth().signIn(withEmail: email, password: password){ authResult,error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                
                completion(true)
                return
            }
        }
        else if let userName = userName {
            //password login
            print(userName)
        }
    }
    ///Attempt to logout user
    public func logOutUser(completion : (Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch{
            print(error)
            completion(false)
            return
        }
    }
}
