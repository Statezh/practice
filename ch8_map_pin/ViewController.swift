//
//  ViewController.swift
//  ch8_map_pin
//
//  Created by 서주현 on 2022/11/02.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblocationInfo1: UILabel!
    @IBOutlet var lblocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblocationInfo1.text = ""
        lblocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblocationInfo1.text = "현재 위치"
            self.lblocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span: Double, title strTitle:String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblocationInfo1.text = ""
            self.lblocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.476206, longitudeValue: 126.881269, delta: 0.01, title: "파이오링크", subtitle: "가산디지털로")
            self.lblocationInfo1.text = "보고계신 위치"
            self.lblocationInfo2.text = "파이오링크"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.527669, longitudeValue: 127.034461, delta: 0.01, title: "아이에스티엔터", subtitle: "언주로")
            self.lblocationInfo1.text = "보고계신 위치"
            self.lblocationInfo2.text = "아이스티엔터"
            
        } else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitudeValue: 37.519397, longitudeValue: 127.127343, delta: 0.01, title: "체조경기장", subtitle: "올림픽공원로")
            self.lblocationInfo1.text = "보고계신 위치"
            self.lblocationInfo2.text = "체조경기장"
            
        }
    }
    
}

