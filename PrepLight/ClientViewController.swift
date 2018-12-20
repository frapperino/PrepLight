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
        questionTable.allowsSelection = false
        questionTable.separatorStyle = .none
        
        if let questions = currentRole?.questions {
            for question in questions{
                self.questions.append(question.value as! String)
            }
        }
        setupView()                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCell
        cell.question.text = questions[indexPath.row]
        cell.heightAnchor.constraint(equalToConstant: )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setupView(){
        self.navigationItem.title = "Client"
        
        view.addSubview(titleLabel)
        view.addSubview(questionTable)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        questionTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        questionTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        questionTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        questionTable.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
}
