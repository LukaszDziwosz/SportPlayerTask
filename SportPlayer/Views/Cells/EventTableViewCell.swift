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
    var dateLabel: UILabel = {
        let lbl = UILabel()
         lbl.font = UIFont.boldSystemFont(ofSize: 16)
         lbl.textAlignment = .left
         return lbl
    }()
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }

}
