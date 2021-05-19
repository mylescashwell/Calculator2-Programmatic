//
//  TextFields.swift
//  Calculator2
//
//  Created by Myles Cashwell on 5/18/21.
//

import UIKit

struct TextFields {
    static let billAmountTextField: UITextField = {
        let billTextField = UITextField()
        billTextField.placeholder = "Total..."
        billTextField.keyboardType = .decimalPad
        billTextField.font = billTextField.font?.withSize(50)
        billTextField.textColor = UIColor(named: "calcBlue2")
        
        return billTextField
    }()
    
    static let tipPercentTextField: UITextField = {
        let tipTextField = UITextField()
        tipTextField.placeholder = "0%"
        tipTextField.keyboardType = .decimalPad
        tipTextField.font = tipTextField.font?.withSize(50)
        tipTextField.textColor = UIColor(named: "calcBlue2")
        
        return tipTextField
    }()
}
