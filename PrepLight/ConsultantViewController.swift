//
//  ConsultantViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-17.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit

class ConsultantViewController: UIViewController {
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Cosultant"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
