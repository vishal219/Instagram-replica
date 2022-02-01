//
//  StorageManager.swift
//  Instagram
//
//  Created by vishalthakur on 28/01/22.
//

import Foundation
import FirebaseStorage

public class StorageManager{
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageError: Error {
        case failedToDownload
    }
    // MARK: - PUBLIC
    
    public func uploadUserPost(model:UserPost,completion: (Result<URL,Error>) -> Void){
        
    }
    
    public func downloadUserPost(with reference: String, completion: @escaping (Result<URL, IGStorageError>) -> Void){
        bucket.child(reference).downloadURL(completion: {(url, error) in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))

        })
    }
}

public enum UserPostType{
    case photo, video
}
public struct UserPost{
    let postType: UserPostType
}
