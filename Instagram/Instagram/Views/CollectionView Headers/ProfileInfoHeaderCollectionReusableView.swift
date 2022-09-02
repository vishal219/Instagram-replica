//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by vishalthakur on 19/05/22.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject {
    func profileHeaderDidTapPosts(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowers(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowing(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfile(_ header: ProfileInfoHeaderCollectionReusableView)
    
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate : ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Posts", for: .normal)
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Followers", for: .normal)
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Following", for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Edit Profile", for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Vishal Thakur"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is my account !!"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addActions()
        clipsToBounds = true
        backgroundColor = .systemBackground
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    private func addActions(){
        postsButton.addTarget(self, action: #selector(postsButtonTapped), for: .touchUpInside)
        followersButton.addTarget(self, action: #selector(followersButtonTapped), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(followingButtonTapped), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(editProfileTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let photosize = width/4
        
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: photosize,
                                             height: photosize).integral
        profilePhotoImageView.layer.cornerRadius = photosize/2.0
        let buttonSize = (width-10-photosize)/3
        let buttonHeight = photosize/2.0
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: buttonSize,
                                   height: buttonHeight).integral
        
        followersButton.frame = CGRect(x: postsButton.right,
                                       y: 5,
                                       width: buttonSize,
                                       height: buttonHeight).integral
        
        followingButton.frame = CGRect(x: followersButton.right,
                                       y: 5,
                                       width: buttonSize,
                                       height: buttonHeight).integral
        
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                         y: 5 + buttonHeight,
                                         width: buttonSize*3,
                                         height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5 + profilePhotoImageView.bottom,
                                 width: width - 10,
                                 height: buttonHeight).integral
        let bioHeight = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: bioLabel.right,
                                y: 5 + nameLabel.bottom,
                                width: width - 10,
                                height: bioHeight.height).integral
    }
    
    @objc private func postsButtonTapped(){
        delegate?.profileHeaderDidTapPosts(self)
    }
    
    @objc private func followersButtonTapped(){
        delegate?.profileHeaderDidTapFollowers(self)
    }
    
    @objc private func followingButtonTapped(){
        delegate?.profileHeaderDidTapFollowing(self)
    }
    
    @objc private func editProfileTapped(){
        delegate?.profileHeaderDidTapEditProfile(self)
    }
    
}
