//
//  BedSchedule.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import Foundation

class BedSchedule {
    var isTurnOn : Bool = false
    var startTime : Date = Date()
    var endTime : Date = Date()
    var reminderTime : Int = 15
    
    init(startTime:Date, endTime:Date, reminderTime:Int) {
        self.startTime = startTime
        self.endTime = endTime
        self.reminderTime = reminderTime
        isTurnOn = true
    }
    
    func getStartTime() -> Date{
        return startTime
    }
    
    func update(startTime:Date, endTime:Date, reminderTime:Int){
        self.startTime = startTime
        self.endTime = endTime
        self.reminderTime = reminderTime
    }
    
    func turnOn(){
        if !isTurnOn{
        isTurnOn = true
        }
    }
    
    func turnOff() {
        if isTurnOn{
        isTurnOn = false
        }
    }
}

