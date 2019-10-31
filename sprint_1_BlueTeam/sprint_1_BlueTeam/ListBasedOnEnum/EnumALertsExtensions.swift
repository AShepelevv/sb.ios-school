//
// Created by Oleg Azhel on 29/10/2019.
// Copyright (c) 2019 BlueTeam. All rights reserved.
//
// MARK: - Alert

import UIKit

extension ListBasedOnEnumViewController {
	// Main alert
	@objc public func actionSelector() {
		let actionController = UIAlertController(title: "Enum Double Linked List", message: "Choose action", preferredStyle:.actionSheet)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		let pushAction = UIAlertAction(title: "Push value", style: .default, handler: {[unowned self] _ in
			self.valueAlertController(completion: {[unowned self] text in
				self.list.push(text)
				self.tableView.reloadData()
			})
		})
		let appendAction = UIAlertAction(title: "Append value", style: .default, handler: {[unowned self] _ in
			self.valueAlertController(completion: {[unowned self] text in
				self.list.append(text)
				self.tableView.reloadData()
			})
		})
		let insertAtAction = UIAlertAction(title: "Insert value at index", style: .default, handler: {[unowned self] _ in
			self.valueAtAlertController(completion: {[unowned self] text, index in
				self.list.insert(value: text, at: UInt(index))
				self.tableView.reloadData()
			})
		})
		let popAction = UIAlertAction(title: "Pop value", style: .default, handler: {[unowned self] _ in
			guard let text = self.list.pop() else {
				self.messageAlert()
				return
			}
			self.tableView.reloadData()
			self.messageAlert("Poped value: \(text)")
		})
		let removeLastAction = UIAlertAction(title: "Remove last value", style: .default, handler: {[unowned self] _ in
			guard let text = self.list.removeLast() else {
				self.messageAlert()
				return
			}
			self.tableView.reloadData()
			self.messageAlert("Removed value: \(text)")
		})
		let removeAtAction = UIAlertAction(title: "Remove value at index", style: .default, handler: {[unowned self] _ in
			self.indexAlertController(completion: {[unowned self] index in
				guard let text = self.list.remove(at: index) else {
					self.messageAlert("List is empty or wrong index")
					return
				}
				self.tableView.reloadData()
				self.messageAlert("Value: \(text)\n removed from index: \(index)")
			})
		})
		let listLengthAction = UIAlertAction(title: "Show length", style: .default, handler: {[unowned self] _ in
			if self.list.isEmpty {
				self.messageAlert()
			} else {
				self.messageAlert("List length: \(self.list.listLength())")
			}
		})
		actionController.addAction(cancelAction)
		actionController.addAction(pushAction)
		actionController.addAction(appendAction)
		actionController.addAction(insertAtAction)
		actionController.addAction(popAction)
		actionController.addAction(removeLastAction)
		actionController.addAction(removeAtAction)
		actionController.addAction(listLengthAction)
		self.present(actionController, animated: true, completion: nil)
	}
	// Alerts
	private func indexAlertController(completion: @escaping (UInt)->()) {
		let alertController = UIAlertController(title: "Enter index", message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		alertController.addTextField(configurationHandler: {(textField) in
			textField.keyboardType = .numberPad
			textField.placeholder = "Enter index"
		})
		let doneAction = UIAlertAction(title: "Done", style: .default, handler: {_ in
			guard let textFields = alertController.textFields else {return}
			guard let textField = textFields.first else {return}
			guard let text = textField.text, text != "" else {return}
			guard let index = UInt(text) else {return}
			completion(index)
		})
		alertController.addAction(doneAction)
		self.present(alertController, animated: true)
	}
	private func valueAlertController(completion: @escaping (String)->()) {
		let alertController = UIAlertController(title: "Enter value", message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		alertController.addTextField(configurationHandler: {(textField) in
			textField.autocapitalizationType = UITextAutocapitalizationType.words
			textField.placeholder = "Enter value"
		})
		let doneAction = UIAlertAction(title: "Done", style: .default, handler: {_ in
			guard let textFields = alertController.textFields else {return}
			guard let textField = textFields.first else {return}
			guard let text = textField.text, text != "" else {return}
			completion(text)
		})
		alertController.addAction(doneAction)
		self.present(alertController, animated: true)
	}
	private func valueAtAlertController(completion: @escaping (String, Int)->()) {
		let alertController = UIAlertController(title: "Enter value", message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		alertController.addTextField(configurationHandler: {(textField) in
			textField.autocapitalizationType = UITextAutocapitalizationType.words
			textField.placeholder = "Enter value"
		})
		alertController.addTextField(configurationHandler: {(textField) in
			textField.keyboardType = .numberPad
			textField.placeholder = "Enter index"
		})
		let doneAction = UIAlertAction(title: "Done", style: .default, handler: {_ in
			guard let textFields = alertController.textFields else {return}
			guard let textField = textFields.first else {return}
			guard let indexField = textFields.last else {return}
			guard let indexText = indexField.text else {return}
			guard let index = Int(indexText) else {return}
			guard let text = textField.text, text != "" else {return}
			completion(text, index)
		})
		alertController.addAction(doneAction)
		self.present(alertController, animated: true)
	}

	// Message alert
	private func messageAlert(_ mssg:String = "List is empty") {
		let alertController = UIAlertController(title: mssg, message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "OK", style: .cancel)
		alertController.addAction(cancelAction)
		present(alertController, animated: true)
	}
}
