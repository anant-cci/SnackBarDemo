//
//  ViewController.swift
//  SnackbarDemo
//
//  Created by Sidhesh Naik on 27/11/17.
//  Copyright © 2017 CCI. All rights reserved.
//

import UIKit
import SnackBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSnackbarButtonTapped(_ sender: Any) {
        SnackBar.show(message: "Test", view: self.view)
    }
}

