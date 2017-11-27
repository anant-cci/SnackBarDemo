//
//  SnackBarManager.swift
//  SnackbarDemo
//
//  Created by Sidhesh Naik on 27/11/17.
//  Copyright © 2017 CCI. All rights reserved.
//

import UIKit

class SnackBarManager: NSObject {
    // MARK:- Singleton
    static private let manager = SnackBarManager()
    
    static func sharedInstance() -> SnackBarManager {
        return manager
    }
    
    func showSnackbarView(message: String , view: UIView) {
        let myCustomSnackBarView = SnackBarView.init(frame: view.frame)
        myCustomSnackBarView.mainLabel.text = message
        let vWindow = UIApplication.shared.keyWindow
        myCustomSnackBarView.frame = CGRect(x: 0, y: view.frame.size.height , width: view.frame.size.width, height: 100)
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            myCustomSnackBarView.frame = CGRect(x: 0, y: view.frame.size.height - 100 , width: view.frame.size.width, height: 100)
            
        }, completion: nil)
        
        vWindow!.addSubview(myCustomSnackBarView)
        
        let date = Date().addingTimeInterval(2)
        let timer = Timer(fireAt: date, interval: 1, target: self, selector: #selector(dismissSnackBar(timer:)), userInfo:myCustomSnackBarView, repeats: false)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc func dismissSnackBar(timer: Timer) {
        let myCustomSnackBarView = timer.userInfo as! SnackBarView
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            myCustomSnackBarView.frame = CGRect(x: 0, y: (myCustomSnackBarView.superview?.frame.size.height)! , width: (myCustomSnackBarView.superview?.frame.size.width)!, height: 100)
            
        }, completion: { (complete) in
            myCustomSnackBarView.removeFromSuperview()
        })
    }
}
