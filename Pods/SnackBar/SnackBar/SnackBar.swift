//
//  SnackBarManager.swift
//  SnackbarDemo
//
//  Created by Sidhesh Naik on 27/11/17.
//  Copyright © 2017 CCI. All rights reserved.
//

import UIKit

public class SnackBar: NSObject {
    private static let snackBarHeight: CGFloat = 75.0

    static public func show(message: String, textColor: UIColor?, backgroundColor: UIColor?, view: UIView) {
        let bundle = Bundle(identifier: "com.cci.SnackBar")
        let snackBarView = bundle?.loadNibNamed("SnackBarView", owner: self, options: nil)?.first as! SnackBarView
        snackBarView.mainLabel.text = message
        
        if let txtColor = textColor {
            snackBarView.mainLabel.textColor = txtColor
        }
        
        if let bgColor = backgroundColor {
            snackBarView.backgroundColor = bgColor
        }
        
        let vWindow = UIApplication.shared.keyWindow
        snackBarView.frame = CGRect(x: 0, y: view.frame.size.height , width: view.frame.size.width, height: self.snackBarHeight)
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            snackBarView.frame = CGRect(x: 0, y: view.frame.size.height - self.snackBarHeight , width: view.frame.size.width, height: self.snackBarHeight)
            
        }, completion: nil)
        
        vWindow!.addSubview(snackBarView)
        
        let date = Date().addingTimeInterval(2)
        let timer = Timer(fireAt: date, interval: 1, target: self, selector: #selector(dismissSnackBar(timer:)), userInfo:snackBarView, repeats: false)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc static fileprivate func dismissSnackBar(timer: Timer) {
        let snackBarView = timer.userInfo as! SnackBarView
        
        UIView.animate(withDuration: 0.50, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            snackBarView.frame = CGRect(x: 0, y: (snackBarView.superview?.frame.size.height)! , width: (snackBarView.superview?.frame.size.width)!, height: self.snackBarHeight)
            
        }, completion: { (complete) in
            snackBarView.removeFromSuperview()
        })
    }
}
