//
//  ViewController.swift
//  NVTouchDemo
//
//  Created by VyNV on 1/4/16.
//  Copyright © 2016 Vy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: NVTouchView!
    @IBOutlet weak var view2: NVTouchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer()
        tapGesture1.addTarget(self, action: Selector("taped:"))
        view1.addGestureRecognizer(tapGesture1)
        view1.backgroundColor = UIColor.blackColor()
        
        let tapGesture2 = UITapGestureRecognizer()
        tapGesture2.addTarget(self, action: Selector("taped:"))
        view2.addGestureRecognizer(tapGesture2)
        view2.backgroundColor = UIColor.blueColor()
    }
    
    func taped(sender:UITapGestureRecognizer){
        print("taped")
    }
}

