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
    lazy var list: DoubleLinkedList<String> = DoubleLinkedList<String>()
    override public func viewDidLoad() {
        super.viewDidLoad()
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
                target: self,
                action: #selector(actionSelector))
    }
}