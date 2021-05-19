//
//  CalculatorViewController.swift
//  Calculator2
//
//  Created by Myles Cashwell on 5/18/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    let labelHeight:     CGFloat = 50
    let leadingPadding:  CGFloat = 40
    let trailingPadding: CGFloat = 20
    let verticalPadding: CGFloat = 20
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        addSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureTextFields()
        configureCalculateButton()
        calculateTip()
    }
    
    
    //MARK: - Views
    let billTotalLabel  = Labels.billAmountLabel
    let tipPercentLabel = Labels.tipPercentLabel
    let youllTipLabel   = Labels.youllTipLabel
    let tipTotalLabel   = Labels.tipTotalLabel
    let overallLabel    = Labels.overallTotalLabel
    
    let billText        = TextFields.billAmountTextField
    let tipText         = TextFields.tipPercentTextField
    
    let calculateButton = Buttons.calculateButton
    
    
    //MARK: - Functions
    func calculateTip() {
        calculateButton.addTarget(self, action: #selector(tipCalculation), for: .touchUpInside)
    }
    
    @objc func tipCalculation() {
        guard let billAmount = billText.text, !billAmount.isEmpty,
              let tipAmount = tipText.text, !tipAmount.isEmpty else { return }
        
        let total = Double(billAmount)!
        let tip = (Double(tipAmount)! / 100) * total
        
        overallLabel.isHidden = false
        overallLabel.text = "Total: $\(tip + total)"
        overallLabel.textColor = .white
        
        youllTipLabel.isHidden = false
        tipTotalLabel.isHidden = false
        tipTotalLabel.text = String(format: "$%.02f", tip)
        print("button tapped")
    }
    
    
    //MARK: - Configurations
    func addSubviews() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.startPoint = CGPoint(x: 0, y: 0)
        gradientBackground.endPoint = CGPoint(x: 1, y: 1)
        gradientBackground.colors = [UIColor(named: "calcBlue1")?.cgColor ?? UIColor.systemBlue.cgColor,
                                     UIColor(named: "calcBlue2")?.cgColor ?? UIColor.systemTeal.cgColor]
        self.view.layer.addSublayer(gradientBackground)
        self.view.addSubview(billTotalLabel)
        self.view.addSubview(tipPercentLabel)
        self.view.addSubview(youllTipLabel)
        self.view.addSubview(tipTotalLabel)
        self.view.addSubview(overallLabel)
        
        self.view.addSubview(billText)
        self.view.addSubview(tipText)
        
        self.view.addSubview(calculateButton)
        
    }
    
    func configureLabels() {
        billTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            billTotalLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80),
            billTotalLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingPadding),
            billTotalLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -200),
            billTotalLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        tipPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipPercentLabel.topAnchor.constraint(equalTo: billTotalLabel.bottomAnchor, constant: verticalPadding),
            tipPercentLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 90),
            tipPercentLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -200),
            tipPercentLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        youllTipLabel.translatesAutoresizingMaskIntoConstraints = false
        youllTipLabel.isHidden = true
        NSLayoutConstraint.activate([
            youllTipLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: verticalPadding),
            youllTipLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingPadding),
            youllTipLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -220),
            youllTipLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        tipTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        tipTotalLabel.isHidden = true
        NSLayoutConstraint.activate([
            tipTotalLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: verticalPadding),
            tipTotalLabel.leadingAnchor.constraint(equalTo: youllTipLabel.trailingAnchor, constant: 10),
            tipTotalLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -trailingPadding),
            tipTotalLabel.heightAnchor.constraint(equalToConstant: labelHeight)

        ])
        
        overallLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overallLabel.topAnchor.constraint(equalTo: youllTipLabel.bottomAnchor, constant: verticalPadding),
            overallLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leadingPadding),
            overallLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -trailingPadding),
            overallLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
    func configureTextFields() {
        billText.translatesAutoresizingMaskIntoConstraints = false
        billText.delegate = self
        NSLayoutConstraint.activate([
            billText.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 75),
            billText.leadingAnchor.constraint(equalTo: billTotalLabel.trailingAnchor, constant: 10),
            billText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -trailingPadding),
            billText.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        tipText.translatesAutoresizingMaskIntoConstraints = false
        tipText.delegate  = self
        NSLayoutConstraint.activate([
            tipText.topAnchor.constraint(equalTo: billText.bottomAnchor, constant: 10),
            tipText.leadingAnchor.constraint(equalTo: tipPercentLabel.trailingAnchor, constant: 10),
            tipText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -trailingPadding),
            tipText.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureCalculateButton() {
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: tipPercentLabel.bottomAnchor, constant: verticalPadding),
            calculateButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 150),
            calculateButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

//MARK: - Extensions
extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
}
