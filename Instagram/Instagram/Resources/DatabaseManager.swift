//
//  DatabaseManager.swift
//  Instagram
//
//  Created by vishalthakur on 28/01/22.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager{
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - PUBLIC
    ///Check if username and email is available
    /// - Parameters
    ///         - email: string representing email
    ///         - username: string representing username
    public func canCreateUser(userName: String,email: String,completion: (Bool) -> Void){
        completion(true)
    }
    
    ///Insert account into database
    /// - Parameters
    ///         - email: string representing email
    ///         - username: string representing username
    ///         - completion : async callback to whether account successfully created or not
    public func insertNewUser(userName: String,email: String,completion:@escaping (Bool) -> Void){
        database.child(email.safeKey()  ).setValue(["userName": userName], withCompletionBlock: { error,_ in
            if error == nil {
                // succeded
                completion(true)
                return
            }
            else{
                //error
                completion(false)
                return
            }
        })
    }
    
}
