//
//  ViewController.swift
//  jsonextract
//
//  Created by Admin on 08/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchPostData { (posts) in
            for post in posts {
                print(post.title!)
                print(post.body!)
                print("\n")
            }
        }
    }

    func fetchPostData(completionHandler: @escaping([Post]) -> Void) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        let task = URLSession.shared.dataTask(with: url) {(data,
        response, error) in
            
            guard let data = data else { return }
            
            do {
             
                let postsData =  try JSONDecoder().decode([Post].self,
                    from: data)
                
                completionHandler(postsData)
        }
            catch {
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
     }

}
