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
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var role1 = Role(title:"iOS Developer", description: "Are you our next developer?", company: "Spotify")
    var role2 = Role(title:"Product owner", description: "Looking for a PO", company: "Bonnier")
    var roles: [Role] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Assignments"

        setupTable()
        setupRows()
    }
    
    func setupTable(){
        roleTable = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        roleTable.allowsMultipleSelection = false
        roleTable.rowHeight = 100
        self.roleTable.separatorStyle = .none
    }
    
    func setupRows(){
        roles.append(role1)
        roles.append(role2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let highlightedCell = roleTable.indexPathForSelectedRow {
            roleTable.deselectRow(at: highlightedCell, animated: true)
        }
        
        roleTable.dataSource = self
        roleTable.delegate = self
        roleTable.register(AssignmentCell.self, forCellReuseIdentifier: "roleCell")
        
        view.addSubview(roleTable)
        roleTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roleTable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let roleCell = tableView.dequeueReusableCell(withIdentifier: "roleCell", for: indexPath) as! AssignmentCell
        let role = self.roles[indexPath.row]
        
        roleCell.assignmentTitle.text = role.title
        roleCell.assignmentCompany.text = role.company
        return roleCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRole = roles[indexPath.row]
        goToRole(role: selectedRole)
    }
    
    func goToRole(role: Role){
        let roleVC = self.storyboard?.instantiateViewController(withIdentifier: "RoleViewController") as? RoleViewController
        roleVC?.currentRole = role
        navigationController?.pushViewController(roleVC!, animated: true)
    }
}


