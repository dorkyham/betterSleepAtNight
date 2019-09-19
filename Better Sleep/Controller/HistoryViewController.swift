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

    var listHistory : [HKSample] = []
    let sleepDataManager = SleepDataManager()
    
    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHistoryList()
    }
    
    func loadHistoryList(){
        sleepDataManager.retrieveSleepAnalysis()
    }
    
}

extension HistoryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryTableViewCell
        let counter = indexPath.row + 1
        
        let date = Date()
        let sleepTime = Date()
        
        cell.titleLabel.text = "\(date)"
        cell.subtitleLabel.text = "\(sleepTime)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ambil data reference-nya
        performSegue(withIdentifier: "goToHistoryDetail", sender: self)
    }
}
