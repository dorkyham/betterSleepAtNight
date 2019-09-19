//
//  SleepData.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import HealthKit

class SleepDataManager{
    let healthStore = HKHealthStore()
    let alarmTime = NSDate()
    let endTime = NSDate()
    
    func retrieveSleepAnalysis(completionHandler: @escaping (([Sleep]) -> Void)) {
        var sleepData : [HKSample] = []
        // first, we define the object type we want
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis){
            
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            // we create our query with a block completion to execute
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    return
                }
                
                if let result = tmpResult {
                    
                    // do something with my data
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            //print(sample)
                            
                            //let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                            
                                //print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            
                                sleepData.append(sample)
                            
                                DispatchQueue.main.async {
                                    var listSleep : [Sleep] = []
                                    if !sleepData.isEmpty{
                                    listSleep = self.appendSleepData(samples: sleepData)
                                    }
                                    else{
                                        listSleep = []
                                    }
                                    
                                    completionHandler(listSleep)
                                    
                                }
                            }
                        }
                    }
                }
            
            // finally, we execute our query
            healthStore.execute(query)
        }
        
}

    
    func appendSleepData(samples:[HKSample])->[Sleep]{
        var sleeps : [Sleep] = []
        for item in samples {
            let duration = Calendar.current.dateComponents([.hour, .minute], from: item.startDate, to: item.endDate)
            let quality = 0
        
            let sleep = Sleep(duration: duration, quality: quality, endDate: item.endDate, startDate: item.startDate)
            print(sleep)
            sleeps.append(sleep)
        }
        return sleeps
    }
    
    func saveSleepAnalysis() {
        // alarmTime and endTime are NSDate objects
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            
            // we create our new object we want to push in Health app
            let object = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.inBed.rawValue, start: self.alarmTime as Date, end: self.endTime as Date)
            
            // at the end, we save it
            healthStore.save(object, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    // something happened
                    return
                }
                
                if success {
                    print("My new data was saved in HealthKit")
                    
                } else {
                    // something happened again
                }
                
            })
            
            
            let object2 = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.asleep.rawValue, start: self.alarmTime as Date, end: self.endTime as Date)
            
            healthStore.save(object2, withCompletion: { (success, error) -> Void in
                if error != nil {
                    // something happened
                    return
                }
                
                if success {
                    print("My new data (2) was saved in HealthKit")
                } else {
                    // something happened again
                }
                
            })
            
        }
        
    }
}
