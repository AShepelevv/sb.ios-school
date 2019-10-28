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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let result = String(Sum(a: "aaaa", b: "bbbbb"))
        
        sumResultLabel.text = result
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


protocol NumericOrString {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Float: NumericOrString {}
extension Double: NumericOrString {}
extension Int: NumericOrString{}
extension Int32: NumericOrString{}
extension Int64: NumericOrString{}
extension String: NumericOrString{}



