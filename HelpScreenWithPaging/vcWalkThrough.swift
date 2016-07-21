//
//  vcWalkThrough.swift
//
//  Created by Rakesh Kumar on 08/06/16.
//  Copyright © 2016 Rakesh. All rights reserved.
//

import UIKit

class vcWalkThrough: UIViewController,UIScrollViewDelegate {
    
    //Variables
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var screens:[String] = ["1", "2", "3"]
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    let objRLib = RLibrary()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        objRLib.setPagingViews(scrollView, pageControl: pageControl, screenArray: screens, currentView: self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
        
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

