//
//  NotiExtentsion.swift
//  Plani
//
//  Created by Raad Amar on 03.05.25.
//

import UserNotifications
import UIKit

extension Datastructur {
    
     static func GiveMeDayInMo() -> Int {
        let day = Calendar.current.component(.day, from: Date())
        return day
    }
    
    static func showMeAllnotification(){
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            //print("Notification Amount : ", requests.count)
        }
    }
    
    static func RemoveAllnotification(){
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
    
    static func dispatchWeeklyNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            let shouldloadnewNoti = requests.isEmpty
            if shouldloadnewNoti {
                LoadNotiForMounth()
            }
        }
    }
    
    static func initNotificationFromJason()->[NotificationItem] {
        guard let url  = Bundle.main.url(forResource: k.Notification, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let arr  = try? JSONDecoder().decode([NotificationItem].self, from: data)
        else {print("decoding notificatino failed"); return [] }
        return arr
    }
    

    private static func LoadNotiForMounth() {
        let center = UNUserNotificationCenter.current()
        let calendar = Calendar.current
        let todayStart = calendar.startOfDay(for: Date())
        let range = calendar.range(of: .day, in: .month, for: Date())?.count ?? 30
        let RunTo = range - GiveMeDayInMo()
        var NotificationEmpty = false
        
        for i in 0...RunTo {
            if !Datastructur.NotificationsArray!.isEmpty {
                let item = Datastructur.NotificationsArray!.removeFirst()
                guard let fireDate = calendar.date(byAdding: .day, value: i, to: todayStart) else { return }
                var comps = calendar.dateComponents([.year, .month, .day], from: fireDate)
                comps.hour = 6
                comps.minute = 0
                comps.timeZone = TimeZone(identifier: "Europe/Berlin")
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)

                let content = UNMutableNotificationContent()
                content.title = item.title
                content.body = item.message
                content.sound = .default

                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger
                )
            
                center.add(request) { error in
                    if let err = error {
                        print("❌ Fehler bei „\(item.title)“: \(err)")
                    } else {
                        print("✅ „\(item.title)“ geplant für \(comps.year!)-\(comps.month!)-\(comps.day!) at Time  \(comps.hour!):\(comps.minute!)")
                        
                    }
                }
                
            }
            else { NotificationEmpty = true; break;}
        }
        Datastructur.Functions.SaveNotifcation()
        Datastructur.Functions.LoadNotifcation()
        if NotificationEmpty {  ResetNotificationIsEmpty()}
    }
    
    private static func ResetNotificationIsEmpty(){
        Defaults.set(false, forKey: k.Defaults.FirstLaunchNotification)
        self.Functions.initNotification(DataFilePath: k.DataFilePathNotification!)
        self.Functions.SaveNotifcation()
        self.Functions.LoadNotifcation()
        LoadNotiForMounth()
    }
    
    
}

