//
//  ListViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-13.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dbref = Database.database().reference()
    
    var roleTable: UITableView  = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var assignments: [Role] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Assignments"
        
        setupTable()
        setupRows()
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
    
    func setupTable(){
        roleTable = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        roleTable.allowsMultipleSelection = false
        roleTable.rowHeight = 100
        self.roleTable.separatorStyle = .none
    }
    
    func setupRows(){
        dbref.child("assignments").observeSingleEvent(of: .value, with: { (snapshot) in
            if let values = snapshot.value as? NSDictionary{
                print(values)
                for value in values {
                    print(value)
                    let role = Role(assignment: value.value as! NSDictionary)
                    print(role)
                    self.assignments.append(role)
                    print(self.assignments)
                }
                self.roleTable.reloadData()
            }
        }){ (error) in
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let roleCell = tableView.dequeueReusableCell(withIdentifier: "roleCell", for: indexPath) as! AssignmentCell
        let role = self.assignments[indexPath.row]
        print(role)
        roleCell.assignmentTitle.text = role.title
        roleCell.assignmentCompany.text = role.company
        return roleCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let assignmentCount = assignments.count
        return assignmentCount
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRole = assignments[indexPath.row]
        goToRole(role: selectedRole)
        
    }
    
    func goToRole(role: Role){
        let roleVC = self.storyboard?.instantiateViewController(withIdentifier: "RoleViewController") as? RoleViewController
        roleVC?.currentRole = role
        navigationController?.pushViewController(roleVC!, animated: true)
    }
}


