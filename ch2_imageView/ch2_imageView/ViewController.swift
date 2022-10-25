//
//  ViewController.swift
//  ch2_imageView
//
//  Created by 서주현 on 2022/10/25.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet var viewScreen: UIImageView!
    @IBOutlet var btnPrev: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    var numImage = 1
    let maxImage = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewScreen.image = UIImage(named:"1.png")
    }

 
    @IBAction func showPrevImg(_ sender: UIButton) {
        numImage = numImage - 1
        if numImage < 1 {
            numImage = maxImage
        }
        let imageName = String(numImage) + ".png"
        viewScreen.image = UIImage(named: imageName)
    }
    @IBAction func showNextImg(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage > maxImage) {
            numImage = 1
        }
        let imageName = String(numImage) + ".png"
        viewScreen.image = UIImage(named:imageName)
    }
}

