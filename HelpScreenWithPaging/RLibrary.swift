//
//  Rlibrary.swift
//
//  Created by Rakesh Kumar on 02/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import UIKit

class RLibrary: NSObject {
    
    //Mark:- set pagecontrol with scrollview
    func setPagingViews(scrollView: UIScrollView, pageControl pgCtrl: UIPageControl, screenArray screens: [String], currentView view: UIView) {
    
        let screenSize = UIScreen.mainScreen().bounds.size
        scrollView.frame = CGRectMake(10, 5, screenSize.width, screenSize.height)
        //Set Page Control
        pgCtrl.frame = CGRectMake(((screenSize.width/2) - 100), 200, 200, 50)
        pgCtrl.transform = CGAffineTransformMakeScale(1.5, 1.5);
        pgCtrl.bringSubviewToFront(scrollView)
        
        //Configure Page Control
        configurePageControl(pgCtrl, currentView: view, numberOfPages: screens.count)
        
        view.addSubview(scrollView)
        for index in 0..<screens.count {
            
            scrollView.pagingEnabled = true
            
            let image : UIImage = UIImage(named: screens[index])!
            let screenView = UIImageView.init(image: image)
            screenView.frame = CGRectMake(scrollView.frame.size.width * CGFloat(index), 40, 300, 150)
            
            scrollView.addSubview(screenView)
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * CGFloat(screens.count), scrollView.frame.size.height)
        
        pgCtrl.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    func configurePageControl(pageControl: UIPageControl, currentView view: UIView, numberOfPages pageCount: Int) {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.blackColor()
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        view.addSubview(pageControl)
    }
}

