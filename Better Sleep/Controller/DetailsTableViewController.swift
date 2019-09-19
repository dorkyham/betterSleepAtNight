//
//  DetailsTableViewController.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 19/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    var duration:DateComponents?
    var startDate:Date?
    var endDate:Date?
    var quality:Int?
    
    
    @IBOutlet weak var startTimeOutlet: UILabel!
    
    @IBOutlet weak var endTimeOutlet: UILabel!
    
    
    @IBOutlet weak var durationOutlet: UILabel!
    
    @IBOutlet weak var qualityOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }

    func loadTableView(){
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startDateString = formatter.string(from: startDate!)
        let endDateString = formatter.string(from: endDate!)
        let hour = duration!.hour
        let minute = duration!.minute
        
        let hourString = String(hour!)
        let minuteString = String(minute!)
        let qualityString = String(quality!)
        
        startTimeOutlet.text = "\(startDateString)"
        endTimeOutlet.text = "\(endDateString)"
        durationOutlet.text = "\(hourString)h \(minuteString)m"
        qualityOutlet.text = "\(qualityString)"
    }
    

}
