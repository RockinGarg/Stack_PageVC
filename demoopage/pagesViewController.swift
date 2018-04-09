//
//  pagesViewController.swift
//  demoopage
//
//  Created by Jatin on 24/07/17.
//  Copyright © 2017 iOS-Trainee. All rights reserved.
//

import UIKit

class pagesViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate,loadNextController {
    
    func LoadNext()
    {
        switch VC.CurrentVC
        {
        case page1:
            VC.CurrentVC = page2
            getNextVC(newIndex: page2)
            
            break
        case page2:
            VC.CurrentVC = page3
            getNextVC(newIndex: page3)
            
            break
        case page3:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
            break
        default:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
        }
    }
    

    var pages = [UIViewController]()
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    var page1 = UIViewController()
    var page2 = UIViewController()
    var page3 = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myView = view?.subviews.first as? UIScrollView {
            myView.canCancelContentTouches = false
        }

        self.delegate = self
        self.dataSource = self //here commented to disable default gestures of pageViewCOntroller
        
        page1 = (storyboard?.instantiateViewController(withIdentifier: "page1"))!
        page2 = (storyboard?.instantiateViewController(withIdentifier: "page2"))!
        page3 = (storyboard?.instantiateViewController(withIdentifier: "page3"))!
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        VC.CurrentVC = page1

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addUIButton()
        self.addSecondUIButton()
    }
    
    func addUIButton(){
        
        let myButton = UIButton()
        myButton.setTitle("Next", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.red, for: .normal)
        myButton.frame = CGRect(x: self.view.frame.size.width - 50, y: self.view.frame.size.height/2 - 50, width: 50, height: 50)
        myButton.addTarget(self, action: #selector(pagesViewController.pressed(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
        self.view.bringSubview(toFront: myButton)
    }
    func addSecondUIButton(){
        
        let myButton = UIButton()
        myButton.setTitle("Previous", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.red, for: .normal)
        myButton.frame = CGRect(x: 20, y: self.view.frame.size.height/2 - 50, width: 100, height: 50)
        myButton.addTarget(self, action: #selector(pagesViewController.Secondpressed(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
        self.view.bringSubview(toFront: myButton)
    }
    
    func pressed(sender: UIButton!) {
        switch VC.CurrentVC {
        case page1:
            VC.CurrentVC = page2
            getNextVC(newIndex: page2)
            
            break
        case page2:
            VC.CurrentVC = page3
            getNextVC(newIndex: page3)
            
            break
        case page3:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
            break
        default:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
        }
    }
    func Secondpressed(sender: UIButton!) {
        switch VC.CurrentVC {
        case page1:
            VC.CurrentVC = page3
            getNextVC(newIndex: page3)
            
            break
        case page3:
            VC.CurrentVC = page2
            getNextVC(newIndex: page2)
            
            break
        case page2:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
            break
        default:
            VC.CurrentVC = page1
            getNextVC(newIndex: page1)
            
        }
    }
    
    func getNextVC(newIndex: UIViewController){
        
        setViewControllers([newIndex], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let currentIndex = pages.index(of: viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        self.appDel.pageindex = previousIndex
        if currentIndex == 0 {
            return nil
        }
        else {
            return pages[previousIndex]
        }

    }
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.clear
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        self.appDel.pageindex = nextIndex
        if nextIndex == 0 {
            return nil
        }
        else {
            return pages[nextIndex]
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
