//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by vishalthakur on 01/02/22.
//

import UIKit

class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(){
        //configure cell
    }
    
}
