//
// Created by Oleg Azhel on 01.11.2019.
// Copyright (c) 2019 BlueTeam. All rights reserved.
//

import UIKit

public class AlertControllerFabric:NSObject {
	// MARK: - Properties
	private weak var viewController:UIViewController!
	public var pushHandler:((String) -> Void)!
	public var appendHandler:((String) -> Void)!
	public var insertAtHandler:((_ value:String, _ index: UInt) -> Void)!
	public var popHandler:(() -> ())!
	public var removeLastHandler:(() -> ())!
	public var removeAtHandler:((UInt) -> ())!
	public var listLengthHandler:(() -> ())!

	// MARK: - Init
	init(_ viewController:UIViewController) {
		super.init()
		self.viewController = viewController
	}
}

	// MARK: - Action selector
extension AlertControllerFabric {
	@objc public func actionSelector() {
		let actionController = UIAlertController(title: "Enum Double Linked List", message: "Choose action", preferredStyle:.actionSheet)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		actionController.addAction(cancelAction)
		let pushAction = UIAlertAction(title: "Push value", style: .default, handler: {[unowned self] _ in
			self.valueAlertController(completion: {[unowned self] text in
				self.pushHandler(text)
			})
		})
		actionController.addAction(pushAction)
		let appendAction = UIAlertAction(title: "Append value", style: .default, handler: {[unowned self] _ in
			self.valueAlertController(completion: {[unowned self] text in
				self.appendHandler(text)
			})
		})
		actionController.addAction(appendAction)
		let insertAtAction = UIAlertAction(title: "Insert value at index", style: .default, handler: {[unowned self] _ in
			self.valueAtAlertController(completion: {[unowned self] text, index in
				self.insertAtHandler(text, UInt(index))
			})
		})
		actionController.addAction(insertAtAction)
		let popAction = UIAlertAction(title: "Pop value", style: .default, handler: {[unowned self] _ in
			self.popHandler()
		})
		actionController.addAction(popAction)
		let removeLastAction = UIAlertAction(title: "Remove last value", style: .default, handler: {[unowned self] _ in
			self.removeLastHandler()
		})
		actionController.addAction(removeLastAction)
		let removeAtAction = UIAlertAction(title: "Remove value at index", style: .default, handler: {[unowned self] _ in
			self.indexAlertController(completion: {[unowned self] index in
				self.removeAtHandler(index)
			})
		})
		actionController.addAction(removeAtAction)
		let listLengthAction = UIAlertAction(title: "Show length", style: .default, handler: {[unowned self] _ in
			self.listLengthHandler()
		})
		actionController.addAction(listLengthAction)
		viewController.present(actionController, animated: true)
	}
}

	// MARK: - Value alert
extension AlertControllerFabric {
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
		viewController.present(alertController, animated: true)
	}
}

	// MARK: - Value at alert
extension AlertControllerFabric {
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
		viewController.present(alertController, animated: true)
	}
}

	// MARK: - Index alert
extension AlertControllerFabric {
	private func indexAlertController(completion: @escaping (UInt)->()) {
		let alertController = UIAlertController(title: "Enter index", message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		alertController.addTextField(configurationHandler: {textField in
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
		viewController.present(alertController, animated: true)
	}
}

// MARK: - Message alert
extension AlertControllerFabric {
	public func messageAlert(_ mssg:String = "List is empty") {
		let alertController = UIAlertController(title: mssg, message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		alertController.addAction(cancelAction)
		viewController.present(alertController, animated: true)
	}
}
