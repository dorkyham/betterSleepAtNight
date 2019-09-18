//
//  RoundedButton.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func didMoveToWindow() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
}

