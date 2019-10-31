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
        guard !firstTextField.text!.isEmpty, !secondTextField.text!.isEmpty else {
            result = "Enter two values"
            sumResultLabel.text = result
            return
        }
        if let first = Int(firstTextField.text!), let second = Int(secondTextField.text!){
            
            result = String(Sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }
        if let first = Double(firstTextField.text!), let second = Double(secondTextField.text!) {
            result = String(Sum(a: first, b: second))
            sumResultLabel.text = result
            return
        }
        else{
            result = String(Sum(a: firstTextField.text!, b: secondTextField.text!))
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


