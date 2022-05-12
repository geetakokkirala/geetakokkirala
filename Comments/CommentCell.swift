//
//  CommentCell.swift
//  NutmegTest
//
//  Created by Admin on 11/05/2022.
//

import Foundation
import UIKit



class CommentCell: UITableViewCell {

    let titleLabel = UILabel().title()
    let bodyLabel = UILabel().body()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(bodyLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setup(comment: Comment) {
        titleLabel.text = comment.name
        bodyLabel.text = comment.body
    }

}
