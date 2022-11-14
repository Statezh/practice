//
//  ViewController.swift
//  ch9_pagecontrol
//
//  Created by 서주현 on 2022/10/14.
//

import UIKit

var images = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg",]
class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        
        pageControl.currentPageIndicatorTintColor = UIColor.systemPink
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    
}

