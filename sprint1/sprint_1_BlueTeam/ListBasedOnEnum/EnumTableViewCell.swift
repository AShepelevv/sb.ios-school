//
// Created by Oleg Azhel on 29/10/2019.
// Copyright (c) 2019 BlueTeam. All rights reserved.
//

import UIKit

public final class EnumTableViewCell:UITableViewCell {
	public override init(style: CellStyle, reuseIdentifier: String?) {
		super.init(style:style, reuseIdentifier:reuseIdentifier)
		addView()
	}

	required init?(coder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	private var stackView:UIStackView!
	private var prevLabel:UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		return label
	}()
	private var valueLabel:UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		return label
	}()
	private var nextLabel:UILabel = {
		let label = UILabel()
		label.textAlignment = .right
		return label
	}()
}

extension EnumTableViewCell {
	private func addView() {
		stackView = UIStackView()
		contentView.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
		stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
		stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.addArrangedSubview(prevLabel)
		stackView.addArrangedSubview(valueLabel)
		stackView.addArrangedSubview(nextLabel)
	}
}
extension EnumTableViewCell {
	public func parseData(_ data:(prev:String, value:String, next:String)) {
		self.prevLabel.text = data.prev
		self.valueLabel.text = data.value
		self.nextLabel.text = data.next
	}
}
