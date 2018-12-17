//
//  AssignmentCell.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-14.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import Foundation
import UIKit

class AssignmentCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var assignmentTitle: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var assignmentCompany: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowIcon: UIImageView = {
       var image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setupViews(){
        addSubview(assignmentTitle)
        assignmentTitle.leftAnchor.constraint(lessThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        assignmentTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        addSubview(assignmentCompany)
        assignmentCompany.leftAnchor.constraint(equalTo: assignmentTitle.leftAnchor).isActive = true
        assignmentCompany.topAnchor.constraint(equalTo: assignmentTitle.bottomAnchor, constant: 10).isActive = true
        
        addSubview(arrowIcon)
        arrowIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
