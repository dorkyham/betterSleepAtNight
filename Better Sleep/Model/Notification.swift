//
//  Notification.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 19/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import Foundation
import UserNotifications

class Notification {
    let content = UNMutableNotificationContent()
    let alarm = Alarm()
    
    func notifyBedtime(start: DateComponents){
        content.title = "Bedtime Schedule is Coming!"
        content.body = "Your bedtime schedule will be started in 15 minutes, please put down your phone on table and sleep well."
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: start, repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                print(error)
            }
            self.alarm.lullaby()
        }
    }
    
    func alertToWakeUp(end: DateComponents){
        content.title = "Rise and Shine!"
        content.body = "Did you have good night sleep? If so, good luck on your today activity!"
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: end, repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                print(error)
            }
            self.alarm.lullaby()
        }
    }
}
