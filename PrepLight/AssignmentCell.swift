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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var assignmentCompany: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowIcon: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var imageIcon: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "default")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setupViews(){
        
        addSubview(imageIcon)
        imageIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(assignmentTitle)
        assignmentTitle.leftAnchor.constraint(lessThanOrEqualTo: imageIcon.rightAnchor, constant: 20).isActive = true
//        assignmentTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        assignmentTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        
        addSubview(assignmentCompany)
        assignmentCompany.leftAnchor.constraint(equalTo: assignmentTitle.leftAnchor).isActive = true
//        assignmentCompany.topAnchor.constraint(equalTo: assignmentTitle.bottomAnchor, constant: 10).isActive = true
        assignmentCompany.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12).isActive = true
        
        addSubview(arrowIcon)
        arrowIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arrowIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        arrowIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
