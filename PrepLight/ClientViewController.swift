//
//  ClientViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-17.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentRole: Role?
    var questions: [String] = []
    
    var questionTable: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //TODO: MAKE THIS LABEL ANOTHER CUSTOM UITABLECELL?
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Questions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTable.dataSource = self
        questionTable.delegate = self
        questionTable.register(QuestionCell.self, forCellReuseIdentifier: "questionCell")
        questionTable.register(TableHeaderCell.self, forCellReuseIdentifier: "tableHeaderCell")
        questionTable.allowsSelection = false
        questionTable.separatorStyle = .none
        
        if let questions = currentRole?.questions {
            for question in questions{
                self.questions.append(question.value as! String)
            }
        }
        
        questionTable.rowHeight = UITableView.automaticDimension
        questionTable.estimatedRowHeight = 100
        
        setupView()                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableHeaderCell", for: indexPath) as! TableHeaderCell
            cell.headerLabel.text = "Questions"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCell
            cell.question.text = questions[indexPath.row-1]
            
            cell.contentView.setNeedsLayout()
            cell.contentView.layoutIfNeeded()
            
            return cell
        }
    }
    
    func setupView(){
        self.navigationItem.title = "Client"
        
        view.addSubview(questionTable)
        
        questionTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        questionTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        questionTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        questionTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  
    }
    
}
