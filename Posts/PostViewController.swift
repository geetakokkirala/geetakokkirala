//
//  PostViewController.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import UIKit

class PostViewController: UIViewController {

    private let viewModel: PostViewModel
    private let tableView = UITableView()
   
    init(viewModel: PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        initViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.onViewAppear(view: self)
    }

    private func initViewModel(){
            viewModel.onPostModelChange = { [unowned self] in
                 DispatchQueue.main.async {
                     self.tableView.reloadData()
                 }
              }

        }

}

// Data for table

extension PostViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count // returns the number of posts
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
               let user = viewModel.users.first(where: { $0.id == viewModel.posts[indexPath.row].userId })!
               let numberOfComments = viewModel.comments.filter { $0.postId == viewModel.posts[indexPath.row].id }.count
               cell.setup(title: viewModel.posts[indexPath.row].title,
                          body: viewModel.posts[indexPath.row].body,
                          user: user,
                          commentsNumber: numberOfComments)
               return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let users = viewModel.users
        let post = viewModel.posts[indexPath.row]
        let comments = viewModel.comments.filter { $0.postId == viewModel.posts[indexPath.row].id }
        let VC = CommentsViewController(post: post, users: users, comments: comments)
        self.navigationController?.pushViewController(VC, animated: true)
    }

}

