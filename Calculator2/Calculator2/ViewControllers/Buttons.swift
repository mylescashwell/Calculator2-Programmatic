//
//  Buttons.swift
//  Calculator2
//
//  Created by Myles Cashwell on 5/18/21.
//

import UIKit

struct Buttons {
    static let calculateButton: UIButton = {
        let calculateButton = UIButton(type: .custom)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.backgroundColor = UIColor(named: "calcBlue3")
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 75.0
        
        return calculateButton
    }()
}
