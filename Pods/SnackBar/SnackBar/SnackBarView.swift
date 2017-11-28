//
//  SnackBarView.swift
//  SnackbarDemo
//
//  Created by Sidhesh Naik on 27/11/17.
//  Copyright © 2017 CCI. All rights reserved.
//

import UIKit

internal class SnackBarView: UIView {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
