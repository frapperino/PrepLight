//
//  ListViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-13.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var roleTable: UITableView  = {
       var table =   UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var role1 = Role(title:"iOS Developer", description: "Are you our next developer?")
    var role2 = Role(title:"Product owner", description: "Looking for a PO")
    
    var roles: [Role] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesBackButton = true
        
        roleTable = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        setupRows()
        
    }
    
    func setupRows(){
        roles.append(role1)
        roles.append(role2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        roleTable.dataSource = self
        roleTable.delegate = self
        roleTable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        view.addSubview(roleTable)
        roleTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roleTable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        let role = self.roles[indexPath.row]
        
        cell.textLabel?.text = role.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let selectedRole = roles[indexPath.row]
        goToRole(role: selectedRole)
    }
    
    func goToRole(role: Role){
        if let roleVC = storyboard?.instantiateViewController(withIdentifier: "RoleViewController"){
            navigationController?.pushViewController(roleVC, animated: true)
        }
    }
}
