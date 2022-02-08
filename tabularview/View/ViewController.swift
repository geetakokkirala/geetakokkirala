//
//  ViewController.swift
//  tabularview
//
//  Created by Admin on 08/02/2022.
//

import UIKit

class ViewController: UIViewController {

    private var networkManager = NetworkManager()
    private let postsService = PostsService()
    private var titleStory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchPosts()
        fetchStories()
    }
    
    private func setUpUI() {
        // create the view with code
    }

    private func fetchPosts() {
        // without generic
        networkManager.getPosts(from: NetworkURLs.postsURL) { [weak self] result in
            switch result {
            case .success(let response):
                let firstPost = response.first
                print(firstPost?.title)
                self?.titleStory = (firstPost?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        // with generic
        networkManager.getModel([Post].self, from: NetworkURLs.postsURL) { result in
            switch result {
            case .success(let response):
                let firstPost = response.first
                print(firstPost?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // using service
//        postsService.getModel(from: <#T##String#>, completion: <#T##(Result<[Post], NetworkError>) -> Void#>)
        
    }
    
    private func fetchStories() {
        // without generic
        networkManager.getStories(from: NetworkURLs.baseURL) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        // with generic
        networkManager.getModel(RedditResponse.self, from: NetworkURLs.baseURL) { result in
            switch result {
            case .success(let response):
                print(response.data.children.first?.data.fullname)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
