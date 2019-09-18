//
//  HomeTableViewController.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import HealthKit

class HomeTableViewController: UITableViewController {
    
    
    @IBAction func goToSettings(_ sender: Any) {
    performSegue(withIdentifier: "goToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

   
   

}
