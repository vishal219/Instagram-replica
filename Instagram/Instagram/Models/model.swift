//
//  model.swift
//  Instagram
//
//  Created by vishalthakur on 01/09/22.
//

import Foundation

enum Gender{
    case male, female, other
}

struct UserCounts{
    let followers: Int
    let following: Int
    let posts: Int
}

struct User{
    let username: String
    let name: (first: String,last: String)
    let birthDate: Date
    let gender: Gender
    let counts:[UserCounts]
    let joinDate: Date
}

public enum UserPostType{
    case photo, video
}

///represent a post by user
public struct UserPost{
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL : URL //full resolution photo or video
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLike{
    let username: String
    let postIdentifier: String
}

struct CommentLike{
    let username: String
    let postIdentifier: String
}

struct PostComment{
    let username: String
    let identifier: String
    let text: String
    let likes: [CommentLike]
    let createdDate: Date
}
