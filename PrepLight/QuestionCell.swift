//
//  QuestionCell.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-20.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import Foundation
import UIKit

class QuestionCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let question: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TODO: add fade in and out animation when selecting and deselecting
    let checkButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "checkbox-empty"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                checkButton.setImage(UIImage(named: "checkbox-selected"), for: .normal)
            } else {
                checkButton.setImage(UIImage(named: "checkbox-empty"), for: .normal)
            }
        }
    }
    
    func setupCell(){
        
        self.addSubview(question)
        self.addSubview(checkButton)
        
        checkButton.leftAnchor.constraint(lessThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        checkButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        
        question.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        question.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        question.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 10).isActive = true
        question.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -65).isActive = true
        
        checkButton.addTarget(self, action: #selector(checkmarkPressed), for: .touchUpInside)
        
    }
    
    @objc func checkmarkPressed(){
            isChecked = !isChecked
    }
    
}
