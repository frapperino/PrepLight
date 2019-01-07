//
//  ConsultantViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-17.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit

class ConsultantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentRole: Role?
    var remindersList: [String] = []
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Think about"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var questionTable: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTable.dataSource = self
        questionTable.delegate = self
        questionTable.register(QuestionCell.self, forCellReuseIdentifier: "questionCell")
        questionTable.register(TableHeaderCell.self, forCellReuseIdentifier: "tableHeaderCell")
        questionTable.allowsSelection = false
        questionTable.separatorStyle = .none
        
        if let reminders = currentRole?.reminders {
            print(reminders)
            for reminder in reminders{
                self.remindersList.append(reminder.value as! String)
            }
        }
        
        questionTable.rowHeight = UITableView.automaticDimension
        questionTable.estimatedRowHeight = 100
        
        setupView()        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remindersList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableHeaderCell", for: indexPath) as! TableHeaderCell
            cell.headerLabel.text = "What to think about"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCell
            cell.question.text = remindersList[indexPath.row-1]
            
            cell.contentView.setNeedsLayout()
            cell.contentView.layoutIfNeeded()
            
            return cell
        }
    }
    
    func setupView(){
        self.navigationItem.title = "Consultant"
        
        view.addSubview(questionTable)
        
        questionTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        questionTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        questionTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        questionTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}
