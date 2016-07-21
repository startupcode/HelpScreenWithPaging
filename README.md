# HelpScreenWithPaging
//This code can be used to create simple help screens with multiple views/images. It serves as a Walkthrough.

//For exact implementation, download the code and check.

//To use it in a viewcontroller, call following method.

//Here pass respective objects

//"screens" is an array containing name of the images

let objRLib = RLibrary()

objRLib.setPagingViews(scrollView, pageControl: pageControl, screenArray: screens, currentView: self.view)


# Add following methods

# MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
        
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
