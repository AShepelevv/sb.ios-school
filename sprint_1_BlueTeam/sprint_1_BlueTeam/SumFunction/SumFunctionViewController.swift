//
//  SumFunctionViewController.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 26/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import UIKit

class SumFunctionViewController: UIViewController {

    @IBOutlet weak var sumResultLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBAction func sumButton() {
        let firstTextString = firstTextField.text!
        let secondTextString = secondTextField.text!
        guard !firstTextString.isEmpty, !secondTextString.isEmpty else {
            sumResultLabel.text = "Enter two values"
            return
        }
        if let first = Int(firstTextString), let second = Int(secondTextString) {
            sumResultLabel.text = String(sum(a: first, b: second))
        } else if let first = Double(firstTextString), let second = Double(secondTextString) {
            sumResultLabel.text = String(sum(a: first, b: second))
        } else {
            sumResultLabel.text = sum(a: firstTextString, b: secondTextString)
        }
        if firstTextField.isFirstResponder {
            firstTextField.resignFirstResponder()
        } else {
            secondTextField.resignFirstResponder()
        }
    }
    
    func sum<T : NumericOrString> (a: T, b: T) -> T {
        return a + b
    }
}
