//
//  CommentsViewController.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Foundation

import UIKit

class CommentsViewController: UIViewController {

    private let post: Post
    private let users: [User]
    private let comments: [Comment]

    private let tableView = UITableView()

    init(post: Post, users: [User], comments: [Comment]) {
        self.post = post
        self.users = users
        self.comments = comments
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        tableView.dataSource = self
        view.addSubview(tableView)

        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        tableView.reloadData()
    }

}

// Data for table

extension CommentsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count + 1 // returns the number of comments plus one for post itself
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            let user = users.first(where: { $0.id == post.userId })!
            let numberOfComments = comments.filter { $0.postId == post.id }.count
            cell.setup(title: post.title,
                       body: post.body,
                       user: user,
                       commentsNumber: numberOfComments)
            cell.selectionStyle = .blue
            cell.backgroundColor = .white
            return cell
        } else {
            let comment = comments[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            cell.setup(comment: comment)
            cell.selectionStyle = .none
            return cell
        }
    }
}
