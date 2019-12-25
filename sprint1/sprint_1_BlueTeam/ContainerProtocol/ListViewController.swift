//
//  ListViewController.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 31/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    let list = ListByProtocol<String>()
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var getCountButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var getByIndexButton: UIButton!
    @IBOutlet var indexTextField: UITextField!
    @IBOutlet var getLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        ContainerVCUtilities.addNewString(from: textField, to: list)
        ContainerVCUtilities.updateLabel(label: containerLabel, container: list)
    }
    
    @IBAction func getCountButtonTapped(_ sender: Any) {
        countLabel.text = String(list.count)
    }
    
    @IBAction func getByIndexButtonTapped(_ sender: Any) {
        guard let index = Int(indexTextField.text!) else { return }
        let zero_index = index - 1
        guard zero_index >= 0 else { return }
        getLabel.text = list.getBy(index: zero_index)
    }
}
