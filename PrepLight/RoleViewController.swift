//
//  RoleViewController.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-14.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import UIKit
import FirebaseStorage

class RoleViewController: UIViewController {

    var currentRole: Role?
    var assignmentParagraphs = [String]()
    
    let outerScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let companyIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "default")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let company: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    let consultantButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Consultant", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let clientButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Client", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let refereeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Referee", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let selectRoleLabel: UILabel = {
       let label = UILabel()
        label.text = "Select your role for the workshop:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let outro: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        
        if let role = currentRole {
            let storageRef = Storage.storage().reference()
            if let url = role.imageName {
                let imageRef = storageRef.child(url)
                imageRef.downloadURL { url, error in
                    if error != nil{
                        print(error as Any)
                        return
                    }else{
                        if let imgurl = url{
                            self.companyIcon.loadImageUsingCacheWithUrlString(urlString: imgurl)
                        }
                    }
                }
            }
            
            ac juni 2019 41 -> 30
            c januari 2020 43 + 2-5 -> 33,5
            src januari 2021 47 + 4(5)-10 40

            self.company.text = role.company
            self.navigationItem.title = role.title
            
            view.addSubview(outerScrollView)
            outerScrollView.addSubview(verticalStackView)
            
            verticalStackView.addArrangedSubview(companyIcon)
            verticalStackView.addArrangedSubview(company)
            if let dictionary = role.content?.value(forKey: "paragraphs") as? NSDictionary{
                createParagraphs(paragraphs: dictionary)
            }
            if let dictionary = role.content?.value(forKey: "checklists") as? NSDictionary{
                createCheckLists(lists: dictionary)
            }
            if let roleOutro = role.content?.value(forKey: "outro") as? String{
                outro.text = roleOutro
            }
            verticalStackView.addArrangedSubview(outro)
            verticalStackView.addArrangedSubview(selectRoleLabel)
            verticalStackView.addArrangedSubview(horizontalStackView)
            horizontalStackView.addArrangedSubview(consultantButton)
            horizontalStackView.addArrangedSubview(clientButton)
            horizontalStackView.addArrangedSubview(refereeButton)
            
            outerScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            outerScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            outerScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            outerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            verticalStackView.topAnchor.constraint(equalTo: outerScrollView.topAnchor).isActive = true
            verticalStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            verticalStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            verticalStackView.bottomAnchor.constraint(equalTo: outerScrollView.bottomAnchor).isActive = true
            
            companyIcon.topAnchor.constraint(equalTo: outerScrollView.topAnchor, constant: 20).isActive = true
            companyIcon.leftAnchor.constraint(equalTo: verticalStackView.leftAnchor).isActive = true
            companyIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
            companyIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            horizontalStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            horizontalStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            horizontalStackView.bottomAnchor.constraint(equalTo: outerScrollView.bottomAnchor, constant: -20).isActive = true
            
            consultantButton.addTarget(self, action: #selector(consultantClick), for: .touchUpInside)
            clientButton.addTarget(self, action: #selector(clientClick), for: .touchUpInside)
            refereeButton.addTarget(self, action: #selector(refereeClick), for: .touchUpInside)
        }
    }
    
    func createParagraphs(paragraphs: NSDictionary){
        
        for paragraph in paragraphs {
            let paragraphLabel: UILabel = {
                let label = UILabel()
                label.numberOfLines = 0
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 14)
                return label
            }()
            paragraphLabel.text = paragraph.value as? String
            verticalStackView.addArrangedSubview(paragraphLabel)
        }
    }
    
    func createCheckLists(lists: NSDictionary){
        for list in lists{
            let vStackView: UIStackView = {
               let stackview = UIStackView()
                stackview.axis = .vertical
                stackview.alignment = .leading
                stackview.spacing = 0
                stackview.translatesAutoresizingMaskIntoConstraints = false
                return stackview
            }()
            verticalStackView.addArrangedSubview(vStackView)
            if let checklist = list.value as? NSDictionary{
                let title: UILabel = {
                    let label = UILabel()
                    label.numberOfLines = 0
                    label.font = UIFont.boldSystemFont(ofSize: 16)
                    return label
                }()
                title.text = checklist.value(forKey: "title") as? String
                vStackView.addArrangedSubview(title)
                if let bullets = checklist.value(forKey: "bullets") as? NSDictionary {
                    for bullet in bullets {
                        
                        let bulletPoint: String = "\u{2022}"
                        let formattedString: String = "\(bulletPoint) \(bullet.value)"
                        
                        let bullet: UILabel = {
                            let label = UILabel()
                            label.numberOfLines = 0
                            label.text = formattedString
                            label.font = UIFont.systemFont(ofSize: 14)
                            return label
                        }()
                        vStackView.addArrangedSubview(bullet)
                    }
                }
                
            }
        }
    }
    
    @objc func consultantClick(){
        if let consultantVC =  storyboard?.instantiateViewController(withIdentifier: "ConsultantViewController"){
            self.navigationController?.pushViewController(consultantVC, animated: true)
        }
    }
    
    @objc func clientClick(){
        if let clientVC =  storyboard?.instantiateViewController(withIdentifier: "ClientViewController"){
            self.navigationController?.pushViewController(clientVC, animated: true)
        }
    }
    
    @objc func refereeClick(){
        if let refereeVC =  storyboard?.instantiateViewController(withIdentifier: "RefereeViewController"){
            self.navigationController?.pushViewController(refereeVC, animated: true)
        }
    }

}
