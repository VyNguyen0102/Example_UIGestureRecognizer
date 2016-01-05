//
//  NVTouchView.swift
//  NVTouchDemo
//
//  Created by VyNV on 1/4/16.
//  Copyright © 2016 Vy Nguyen. All rights reserved.
//

import UIKit

class NVTouchView: UIView {
    
    let nibName = "NVTouchView"
    let pinchRec = UIPinchGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    var rotation = CGFloat()
    var view: UIView!
    
    // Custom View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupView()
    }
    
    func setupView() {
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        pinchRec.addTarget(self, action: Selector("pinchedView:"))
        self.addGestureRecognizer(pinchRec)
        
        rotateRec.addTarget(self, action: Selector("rotatedView:"))
        self.addGestureRecognizer(rotateRec)
        
        panRec.addTarget(self, action: Selector("draggedView:"))
        self.addGestureRecognizer(panRec)
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    // Handle Touch Event
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        if let view = sender.view {
            sender.view!.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
            sender.scale = 1.0
        }
    }
    
    func rotatedView(sender:UIRotationGestureRecognizer){
        if let view = sender.view {
            view.transform = CGAffineTransformRotate(view.transform, sender.rotation)
            sender.rotation = 0
        }
    }
    
    func draggedView(sender:UIPanGestureRecognizer){
        if let view = sender.view {
            let translation = sender.translationInView(view.superview)
            self.center = CGPointMake(view.center.x + translation.x, view.center.y + translation.y)
            sender.setTranslation(CGPointZero, inView: view)
        }
    }
    
}
