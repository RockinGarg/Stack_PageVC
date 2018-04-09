//
//  ContentViewController.swift
//  demoopage
//
//  Created by Jatin on 24/07/17.
//  Copyright © 2017 iOS-Trainee. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!    
    @IBOutlet weak var DraggableView: UIView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("called")
        moveDraggableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveDraggableView() {

        print(firstBtn.frame.origin.x)
        if self.appDel.pageindex == 0 {
            DraggableView.frame.origin.x = firstBtn.frame.origin.x
        }
        else if self.appDel.pageindex == 1 {
            DraggableView.frame.origin.x = secondBtn.frame.origin.x
        }
        else if self.appDel.pageindex == 2 {
            DraggableView.frame.origin.x = thirdBtn.frame.origin.x
        }
        
    }


}
