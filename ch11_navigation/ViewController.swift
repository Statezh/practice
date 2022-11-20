//
//  ViewController.swift
//  ch11_Navi
//
//  Created by 서주현 on 2022/11/16.
//

import UIKit

class ViewController: UIViewController, EditDelegate{

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var _isZoom = true
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            //click button
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton"{
            //click bar button
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessages = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = _isZoom

        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            self._isZoom = false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        } else{
            self._isZoom = true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        }
    }
    
}

