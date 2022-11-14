//
//  ViewController.swift
//  ch10_Tab
//
//  Created by 서주현 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnMoveDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
}

