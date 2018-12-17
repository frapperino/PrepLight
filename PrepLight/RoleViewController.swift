//
//  RoleViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-14.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit

class RoleViewController: UIViewController {

    var currentRole: Role?
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Hej"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var consultantButton: UIButton = {
       var button = UIButton(type: .system)
        button.setTitle("Consultant", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var clientButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Client", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var refereeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Referee", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var selectRoleLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select your role for the workshop:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        if let role = currentRole {
            descriptionLabel.text = role.description
            self.navigationItem.title = role.title
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: (navigationController?.navigationBar.frame.height)! + 30).isActive = true
        
        view.addSubview(selectRoleLabel)
        selectRoleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectRoleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(consultantButton)
        consultantButton.topAnchor.constraint(equalTo: selectRoleLabel.bottomAnchor , constant: 10).isActive = true
        consultantButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        consultantButton.addTarget(self, action: #selector(consultantClick), for: .touchUpInside)
        
        view.addSubview(clientButton)
        clientButton.topAnchor.constraint(equalTo: consultantButton.bottomAnchor , constant: 10).isActive = true
        clientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(refereeButton)
        refereeButton.topAnchor.constraint(equalTo: clientButton.bottomAnchor , constant: 10).isActive = true
        refereeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func consultantClick(){
        if let consultantVC =  storyboard?.instantiateViewController(withIdentifier: "ConsultantViewController"){
            self.navigationController?.pushViewController(consultantVC, animated: true)
        }
        
    }

}
