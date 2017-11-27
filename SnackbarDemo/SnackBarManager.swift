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
    private let snackBarHeight: CGFloat = 75.0
    
    static func sharedInstance() -> SnackBarManager {
        return manager
    }
    
    func showSnackbarView(message: String , view: UIView) {
        let myCustomSnackBarView = SnackBarView.init(frame: view.frame)
        myCustomSnackBarView.mainLabel.text = message
        let vWindow = UIApplication.shared.keyWindow
        myCustomSnackBarView.frame = CGRect(x: 0, y: view.frame.size.height , width: view.frame.size.width, height: self.snackBarHeight)
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            myCustomSnackBarView.frame = CGRect(x: 0, y: view.frame.size.height - self.snackBarHeight , width: view.frame.size.width, height: self.snackBarHeight)
            
        }, completion: nil)
        
        vWindow!.addSubview(myCustomSnackBarView)
        
        let date = Date().addingTimeInterval(2)
        let timer = Timer(fireAt: date, interval: 1, target: self, selector: #selector(dismissSnackBar(timer:)), userInfo:myCustomSnackBarView, repeats: false)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc func dismissSnackBar(timer: Timer) {
        let myCustomSnackBarView = timer.userInfo as! SnackBarView
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            myCustomSnackBarView.frame = CGRect(x: 0, y: (myCustomSnackBarView.superview?.frame.size.height)! , width: (myCustomSnackBarView.superview?.frame.size.width)!, height: self.snackBarHeight)
            
        }, completion: { (complete) in
            myCustomSnackBarView.removeFromSuperview()
        })
    }
}
