//
//  ListBasedOnEnumViewController.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 26/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import UIKit

public final class ListBasedOnEnumViewController: UITableViewController {
    // MARK: - ENum
    var list: DoubleLinkedList<String> = DoubleLinkedList<String>() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Properties
    var alertControllerFabric:AlertControllerFabric!

    // MARK: - ViewController lifecycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        alertControllerFabric = AlertControllerFabric(self)
        configureAlertHandlers()
        navBarConfigure()
        tableView.register(EnumTableViewCell.self, forCellReuseIdentifier: "EnumCell")
    }
}

// MARK: - TableView dataSource
extension ListBasedOnEnumViewController {
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(list.listLength())
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EnumCell", for: indexPath) as? EnumTableViewCell else {
            fatalError()
        }
        let node = list.node(at: UInt(indexPath.row))!
        cell.parseData(list.dataTuple(node))
        return cell
    }
}

// MARK: - TableViewDelegate
extension ListBasedOnEnumViewController {
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
}

// MARK: - Navigation bar
extension ListBasedOnEnumViewController {
    private func navBarConfigure() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Enum Linked List"
        navigationItem.rightBarButtonItem = UIBarButtonItem (
                barButtonSystemItem: .action,
                target: alertControllerFabric,
                action: #selector(alertControllerFabric.actionSelector))
    }
}

// MARK: - AlertControllerFabric
extension ListBasedOnEnumViewController {
    private func configureAlertHandlers() {
        alertControllerFabric.pushHandler = {[unowned self] text in
            self.list.push(text)
        }
        alertControllerFabric.appendHandler = {[unowned self] text in
            self.list.append(text)
        }
        alertControllerFabric.insertAtHandler = {[unowned self] text, index in
            self.list.insert(value: text, at: index)
        }
        alertControllerFabric.popHandler = {[unowned self] in
            if let text = self.list.pop() {
                self.alertControllerFabric.messageAlert("Poped value: \(text)")
            } else {
                self.alertControllerFabric.messageAlert()
            }
        }
        alertControllerFabric.removeLastHandler = {[unowned self] in
            if let text = self.list.removeLast() {
                self.alertControllerFabric.messageAlert("Remover value: \(text)")
            } else {
                self.alertControllerFabric.messageAlert()
            }
        }
        alertControllerFabric.removeAtHandler = {[unowned self] index in
            if let text = self.list.remove(at: index) {
                self.alertControllerFabric.messageAlert("Value: \(text)\n removed from index: \(index)")
            } else {
                self.alertControllerFabric.messageAlert("List is empty or wrong index")
            }
        }
        alertControllerFabric.listLengthHandler = {[unowned self] in
            if self.list.isEmpty {
                self.alertControllerFabric.messageAlert()
            } else {
                self.alertControllerFabric.messageAlert("List length: \(self.list.listLength())")
            }
        }
    }
}