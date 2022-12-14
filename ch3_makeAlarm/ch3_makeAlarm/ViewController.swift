//
//  ViewController.swift
//  ch3_makeAlarm
//
//  Created by 서주현 on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime : String?

    @IBOutlet var lbCurrentTime: UILabel!
    @IBOutlet var lbPickerTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbPickerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm:aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
      
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbCurrentTime.text = String(count)
        lbCurrentTime.text = "현재시간:" + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm:aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime){
            view.backgroundColor = UIColor.red
        } else{
            view.backgroundColor = UIColor.white
        }
        
    }
}

