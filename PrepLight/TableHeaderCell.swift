//
//  TableHeaderCell.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2019-01-07.
//  Copyright © 2019 Fredrik Holmdahl. All rights reserved.
//

import Foundation
import UIKit

class TableHeaderCell: UITableViewCell{
    
    var headerLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func setupCell(){
        addSubview(headerLabel)
        
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
    }
    
}
