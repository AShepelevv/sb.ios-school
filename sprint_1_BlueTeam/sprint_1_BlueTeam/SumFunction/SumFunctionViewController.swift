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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sumButton() {
        var result:String
        let firstTextString = firstTextField.text!
        let secondTextString = secondTextField.text!
        guard !firstTextString.isEmpty, !secondTextString.isEmpty else {
            result = "Enter two values"
            sumResultLabel.text = result
            return
        }
        if let first = Int(firstTextString), let second = Int(secondTextString){
            
            result = String(sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }
        if let first = Double(firstTextString), let second = Double(secondTextString) {
            result = String(sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }else{
            result = String(sum(a: firstTextString, b: secondTextString))
            sumResultLabel.text = result
            return
        }
    }
    
    func sum<T : NumericOrString> (a: T, b: T)-> T{
        
        return a+b
    }
}


