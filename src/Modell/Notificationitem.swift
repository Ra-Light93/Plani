//
//  NotificationArray.swift
//  Plani
//
//  Created by Raad Amar on 02.05.25.
//

class NotificationItem : Codable {
    let title : String
    let message : String
    
    init(title: String, Massage: String) {
        self.title = title
        self.message = Massage
    }

}
