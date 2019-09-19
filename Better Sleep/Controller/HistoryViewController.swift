//
//  HistoryViewController.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 19/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import HealthKit

class HistoryViewController: UIViewController {

    var listHistory : [Sleep] = []
    let sleepDataManager = SleepDataManager()
    var duration:DateComponents?
    var startDate:Date?
    var endDate:Date?
    var quality:Int?
    
    
    
    @IBOutlet weak var errorTxt: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        loadHistoryList()
    }
    
    func loadHistoryList(){
        sleepDataManager.retrieveSleepAnalysis(){
            (listSleep) in
            guard !listSleep.isEmpty else{
                self.historyTableView.isHidden = true
                self.errorTxt.isHidden = false
                print("nil")
                return
            }
            DispatchQueue.main.async {
                self.historyTableView.isHidden = false
                self.errorTxt.isHidden = true
                print("ada")
                self.listHistory = listSleep
                self.historyTableView.reloadData()
            }
        }
    }
    
}

extension HistoryViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryTableViewCell
        
        let startDateString = dateFormatter.string(from: listHistory[indexPath.row].startDate)
        
        let endDateString = dateFormatter.string(from: listHistory[indexPath.row].endDate)
        
        let startTime = timeFormatter.string(from: listHistory[indexPath.row].startDate)
        
        let endTime = timeFormatter.string(from: listHistory[indexPath.row].endDate)
        
        
        cell.titleLabel.text = "\(startDateString) - \(endDateString)"
        cell.subtitleLabel.text = "\(startTime) - \(endTime)"
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //ambil data reference-nya
        duration = listHistory[indexPath.row].duration
        startDate = listHistory[indexPath.row].startDate
        endDate = listHistory[indexPath.row].endDate
        quality = listHistory[indexPath.row].quality
        
        print(duration)
        performSegue(withIdentifier: "goToHistoryDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsTableViewController = segue.destination as? DetailsTableViewController
        {
           detailsTableViewController.duration = self.duration
            
            detailsTableViewController.startDate = self.startDate
            
            detailsTableViewController.endDate = self.endDate
            
            detailsTableViewController.quality = self.quality
        }
    }
}
