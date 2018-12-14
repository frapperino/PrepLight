//
//  ViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-13.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let welcomeText: UILabel = {
        var text = UILabel()
        text.text = "Welcome to PrepLight"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.black
        return text
    }()
    
    let getStartedButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Get started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(welcomeText)
        welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(getStartedButton)
        getStartedButton.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 24).isActive = true
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        
    }
    
    
    @objc func getStarted(_ sender: UIButton){
        if let listVC = storyboard?.instantiateViewController(withIdentifier: "ListViewController") {
            navigationController?.pushViewController(listVC, animated: true)
            
        }
    }
    
}

