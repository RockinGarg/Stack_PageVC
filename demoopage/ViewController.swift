//
//  ViewController.swift
//  demoopage
//
//  Created by IosDeveloper on 18/01/18.
//  Copyright © 2018 iOS-Trainee. All rights reserved.
//

import UIKit

protocol loadNextController {
    func LoadNext()
}

class ViewController: UIViewController {
    
    let obj : pagesViewController = pagesViewController()
    var objj = UIViewController()
//    var protocolObj = loadNextController()
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        objj = self.storyboard?.instantiateViewController(withIdentifier: "pagesViewController") as! pagesViewController
        addChildViewController(objj)
        objj.view.translatesAutoresizingMaskIntoConstraints = true
        DispatchQueue.main.async
            {
                
//                self.addUI/(selector: #selector(self.objj.))
                
                //Main Queue Update With All UI
                self.objj.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
                self.containerView.addSubview((self.objj.view)!)
                self.objj.didMove(toParentViewController: self)
        }

    }

    
    func addUIButton(selector: Selector)
    {
        
        let myButton = UIButton()
        myButton.setTitle("Next", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.red, for: .normal)
        myButton.frame = CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height - 50, width: 100, height: 50)
        
        myButton.addTarget(self, action: selector, for: .touchUpInside)
        self.view.addSubview(myButton)
        self.view.bringSubview(toFront: myButton)
    }

}
