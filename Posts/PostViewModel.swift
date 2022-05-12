//
//  PostViewModel.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Combine

class PostViewModel {

    private let api: API
    private var view: PostViewController?
    private var cancellables = [AnyCancellable]()
    var users = [User]()
    var comments = [Comment]()

    var onPostModelChange: (() -> Void)?
    var posts: [Post] = [Post](){
            
            didSet{
                self.onPostModelChange?()
            }
        }
    
    init(api: API = DefaultAPI()) {
        self.api = api
    }

    func onViewAppear(view: PostViewController) {
        self.view = view
        Publishers.Zip3(api.get(path: "/posts", type: [Post].self),
                        api.get(path: "/comments", type: [Comment].self),
                        api.get(path: "/users", type: [User].self))
        .map { [unowned self] posts, comments, users in
            self.reloadData(users: users, posts: posts, comments: comments)
        }.sink { finished in
            if case .failure(let error) = finished {
                print(error)
            }
        } receiveValue: { _ in
        }.store(in: &cancellables)
    }

    func reloadData(users: [User], posts: [Post], comments: [Comment]) {
        self.posts = posts
        self.users = users
        self.comments = comments
    }
}
