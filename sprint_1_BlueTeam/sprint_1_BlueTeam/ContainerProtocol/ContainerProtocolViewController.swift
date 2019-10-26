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
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func listButtonTapped(_ sender: Any) {
        guard let newString =  textField.text else {
            return
        }
        list.push(newElement: newString)
        textField.text = ""
        updateLabel(label: listLabel, list: list)
    }
    
    @IBAction func queueButtonTapped(_ sender: Any) {
        guard let newString = textField.text else {
            return
        }
        queue.push(newElement: newString)
        textField.text = ""
        updateLabel(label: queueLabel, list: queue)
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        popLabel.text = queue.pop() ?? "nil"
        updateLabel(label: queueLabel, list: queue)
    }
    
    
    // MARK: - Model
    func updateLabel(label : UILabel, list : ListByProtocol<String>) {
        var labelText = ""
        label.text = ""
        if (list.count == 0) {
            return
        }
        for i in 0...list.count - 1 {
            if (i != 0) {
                labelText += ", "
            }
            labelText += list.getBy(index: i) ?? "nil"
        }
        label.text = labelText
    }
}
