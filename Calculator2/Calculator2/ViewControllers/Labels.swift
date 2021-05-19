//
//  Labels.swift
//  Calculator2
//
//  Created by Myles Cashwell on 5/18/21.
//

import UIKit

struct Labels {
    static let billAmountLabel: UILabel = {
        let billAmount = UILabel()
        billAmount.text = "Your Bill:"
        billAmount.textColor = .white
        billAmount.font = billAmount.font.withSize(50)
        
        return billAmount
    }()
    
    static let tipPercentLabel: UILabel = {
        let tipPercent = UILabel()
        tipPercent.text = "Tip %:"
        tipPercent.textColor = .white
        tipPercent.font = tipPercent.font.withSize(50)
        
        return tipPercent
    }()
    
    static let youllTipLabel: UILabel = {
        let youllTip = UILabel()
        youllTip.text = "You'll Tip:"
        youllTip.textColor = .white
        youllTip.font = youllTip.font.withSize(40)
        
        return youllTip
    }()
    
    static let tipTotalLabel: UILabel = {
        let tipTotal = UILabel()
        tipTotal.textColor = UIColor(named: "calcBlue3")
        tipTotal.font = .systemFont(ofSize: 40, weight: .semibold)
        
        return tipTotal
    }()
    
    static let overallTotalLabel: UILabel = {
        let overallTotal = UILabel()
        overallTotal.textColor = .white
        overallTotal.font = overallTotal.font.withSize(40)
        
        return overallTotal
    }()
}
