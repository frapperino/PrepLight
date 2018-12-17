//
//  Role.swift
//  PrepLight
//
//  Created by Fredrik Holmdahl on 2018-12-14.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import Foundation


struct Role {
    var title: String?
    var description: String?
    var company: String?
    var questions: NSDictionary?
    var reminders: NSDictionary?
    var checklist: NSDictionary?
    
    init(assignment: NSDictionary) {
        if let roleTitle = assignment.value(forKey: "title") as? String{
            self.title = roleTitle
        }
        
        if let roleDescription = assignment.value(forKey: "description") as? String{
            self.description = roleDescription
        }
        
        if let roleCompany = assignment.value(forKey: "company") as? String{
            self.company = roleCompany
        }
        
        if let roleQuestions = assignment.value(forKey: "questions") as? NSDictionary{
            self.questions = roleQuestions
        }
        
        if let roleReminders = assignment.value(forKey: "reminders") as? NSDictionary{
            self.reminders = roleReminders
        }
        if let roleChecklist = assignment.value(forKey: "checklist") as? NSDictionary {
            self.checklist = roleChecklist
        }
    }
}
