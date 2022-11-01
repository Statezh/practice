//
//  ViewController.swift
//  ch6_make_alarm2
//
//  Created by 서주현 on 2022/11/01.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var alertFlag = false
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var pickerTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM:dd HH:mm:ss EEE"
        pickerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm:aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM:dd HH:mm:ss EEE"
        currentTime.text = "현재시간:" + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm:aaa"
        let realCurrentTime = formatter.string(for: date as Date)
        
        if (alarmTime == realCurrentTime){
            if !alertFlag {
                let alarmOffAlert = UIAlertController(title: "알람끄기", message: "알람끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
                let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: nil)
            
                alarmOffAlert.addAction(offAction)
                present(alarmOffAlert, animated: true, completion: nil)
                alertFlag = true
            }
        } else {
            alertFlag = false
        }
    }
}
