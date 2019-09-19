//
//  SettingsTableViewController.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit
import HealthKit

class SettingsTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    private var datePicker : UIDatePicker?
    
    private var generalPicker = UIPickerView()
    
    var startTime : Date?
    var endTime : Date?
    var selectedReminderTime : Int?
    
    
    
    @IBOutlet weak var startTimeOutlet: UITextField!
    
    @IBOutlet weak var reminderOutlet: UITextField!
    
    @IBOutlet weak var endTimeOutlet: UITextField!
    
    private let reminderTime : [String] = ["15 minutes before", "30 minutes before", "45 minutes before", "1 hour before"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    reminderOutlet.attributedPlaceholder = NSAttributedString(string: "15 Min", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    startTimeOutlet.attributedPlaceholder = NSAttributedString(string: "10.00 PM", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    endTimeOutlet.attributedPlaceholder = NSAttributedString(string: "6.00 AM", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        setPicker()
        setDatePicker()
    }
    
    func setPicker() {
        generalPicker.delegate = self
        reminderOutlet.inputView = generalPicker
    }
    
    func setDatePicker () {
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        
       startTimeOutlet.inputView = datePicker
        
        endTimeOutlet.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @objc func dateChanged (datePicker : UIDatePicker, activeTF : UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        
        if startTimeOutlet.isFirstResponder{
            self.startTimeOutlet.text = dateFormatter.string(from: datePicker.date).uppercased()
            
            startTime = datePicker.date
        }
            
        else if endTimeOutlet.isFirstResponder{
            self.endTimeOutlet.text = dateFormatter.string(from: datePicker.date).uppercased()
            
            endTime = datePicker.date
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if reminderOutlet.isFirstResponder {
            return reminderTime.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if reminderOutlet.isFirstResponder{
            return reminderTime[row]
        }
        else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if reminderOutlet.isFirstResponder {
            switch(row){
            case 0 :
                selectedReminderTime = 15
                break
            case 1 :
                selectedReminderTime = 30
                break
            case 2 :
                selectedReminderTime = 45
                break
            case 3 :
                selectedReminderTime = 60
                break
            default:
                break
            }
            if selectedReminderTime == 60{
            reminderOutlet.text = "1 hour"
            }
            else {
            reminderOutlet.text = "\(selectedReminderTime!) min"
            }
        }
    }
    
    @IBAction func done(_ sender: Any) {
        if startTime != nil || endTime != nil || selectedReminderTime != nil {
        performSegue(withIdentifier: "goToHomeFromSettings", sender: self)
        }
    }
    
}
