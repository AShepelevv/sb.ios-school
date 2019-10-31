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
            
            result = String(Sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }
        if let first = Double(firstTextString), let second = Double(secondTextString) {
            result = String(Sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }else{
            result = String(Sum(a: firstTextString, b: secondTextString))
            sumResultLabel.text = result
            return
        }
    }
    
    func Sum<T : NumericOrString> (a: T, b: T)-> T{
        
        return a+b
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


