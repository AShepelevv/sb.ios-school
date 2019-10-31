//
//  ContainerProtocolViewController.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 26/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//
import UIKit

class ContainerProtocolViewController: UIViewController {
    
    // MARK: - Properties
    let list = ListByProtocol<String>()
    let queue = Queue<String>()
    
    // MARK: - Outlets
    @IBOutlet var listLabel: UILabel!
    @IBOutlet var listButton: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var queueButton: UIButton!
    @IBOutlet var queueLabel: UILabel!
    @IBOutlet var popButton: UIButton!
    @IBOutlet var popLabel: UILabel!
    
    // MARK: - Actions
    @IBAction func listButtonTapped(_ sender: Any) {
        addNewString(to: list)
        updateLabel(label: listLabel, container: list)
    }
    
    @IBAction func queueButtonTapped(_ sender: Any) {
        addNewString(to: queue)
        updateLabel(label: queueLabel, container: queue)
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        popLabel.text = queue.pop() ?? "nil"
        updateLabel(label: queueLabel, container: queue)
    }
    
    // MARK: - Model
    func updateLabel<Container : ContainerProtocol>(label : UILabel, container : Container) where Container.Element == String {
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
    
    func addNewString<Container : ContainerProtocol>(to container : Container)  where Container.Element == String{
        guard let newString =  textField.text else {
            return
        }
        container.push(newElement: newString)
        textField.text = ""
        textField.resignFirstResponder()
    }
}
