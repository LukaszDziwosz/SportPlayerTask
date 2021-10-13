//
//  EventTableViewCell.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 06/10/2021.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    
    let titleLabel: UILabel = {
        let lbl = UILabel()
         lbl.font = UIFont.boldSystemFont(ofSize: 16)
         lbl.textAlignment = .left
         return lbl
    }()
    let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 14.5)
         lbl.textAlignment = .left
         return lbl
    }()
    
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14.5)
         lbl.textAlignment = .left
         return lbl
    }()
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        addSubview(eventImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(dateLabel)
        
        
        eventImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 0, width: 100, height: 80, enableInsets: false)
        
        titleLabel.anchor(top: topAnchor, left: eventImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, enableInsets: false)
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: eventImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 15, enableInsets: false)
        
        dateLabel.anchor(top: nil, left: eventImageView.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 5, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }

}
