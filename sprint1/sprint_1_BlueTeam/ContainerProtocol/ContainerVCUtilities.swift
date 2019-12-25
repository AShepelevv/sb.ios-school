//
//  ContainerVCUtilities.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 31/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import Foundation
import UIKit

class ContainerVCUtilities {
    static func updateLabel<Container : ContainerProtocol>(label : UILabel, container : Container) where Container.Element == String {
        var labelText = ""
        label.text = ""
        if (container.count == 0) {
            return
        }
        for i in 0...container.count - 1 {
            if (i != 0) {
                labelText += " -> "
            }
            labelText += container.getBy(index: i) ?? "nil"
        }
        label.text = labelText
    }
    
    static func addNewString<Container : ContainerProtocol>(from textField: UITextField, to container : Container)  where Container.Element == String{
        guard let newString =  textField.text else {
            return
        }
        container.push(newElement: newString)
        textField.text = ""
        textField.resignFirstResponder()
    }
}
