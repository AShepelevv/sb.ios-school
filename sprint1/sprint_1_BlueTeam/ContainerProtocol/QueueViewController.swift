//
//  QueueViewController.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 31/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController {

    let queue = Queue<String>()
    
    @IBOutlet var containerLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var countButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var popButton: UIButton!
    @IBOutlet var popedStringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        ContainerVCUtilities.addNewString(from: textField, to: queue)
        ContainerVCUtilities.updateLabel(label: containerLabel, container: queue)
    }
    
    @IBAction func countButtonTapped(_ sender: Any) {
        countLabel.text = String(queue.count)
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        popedStringLabel.text = queue.pop()
        ContainerVCUtilities.updateLabel(label: containerLabel, container: queue)
    }
}
