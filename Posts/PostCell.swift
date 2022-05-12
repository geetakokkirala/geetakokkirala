//
//  PostCell.swift
//  NutmegTest
//
//  Created by Admin on 11/05/2022.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {
    let titleLabel = UILabel().title()
    let bodyLabel = UILabel().body()
    let detailLabel = UILabel().caption()
    let likeButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(bodyLabel)
        stack.addArrangedSubview(detailLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false

        likeButton.setTitle("Like", for: .normal)
        likeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: nil)
        likeButton.setTitleColor(.red, for: .normal)
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        stack.addArrangedSubview(likeButton)

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

    public func setup(title: String, body: String, user: User, commentsNumber: Int) {
        titleLabel.text = title
        bodyLabel.text = body
        detailLabel.text = "\(user.username)" + " | " + "\(commentsNumber) comment(s)"
    }

    @objc
    public func likeTapped() {
        // TODO
    }

}

extension UILabel {
    func caption() -> Self {
        self.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: nil)
        self.textColor = .gray
        return self
    }
}
