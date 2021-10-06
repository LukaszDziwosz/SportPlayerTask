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
         lbl.textColor = .black
         lbl.font = UIFont.boldSystemFont(ofSize: 16)
         lbl.textAlignment = .left
         return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    }

}
