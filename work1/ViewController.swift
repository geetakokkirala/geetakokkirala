//
//  ViewController.swift
//  work1
//
//  Created by Admin on 07/02/2022.
//

import UIKit

class ViewController: UIViewController {
            
            private lazy var image: UIImageView = {
                let image = UIImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFit
                image.backgroundColor = .lightGray
                return image
            }()
            
            private lazy var button: UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle("Load a new Image", for: .normal)
                button.setTitleColor(.blue, for: .normal)
                button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                return button
            }()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
                // Create URL
                //getImageUrl()

            }
            
            private func getImageUrl(){
                let frame = image.frame
                let width:Int = Int(frame.size.width)
                let height:Int =  Int(frame.size.height)
                let imageUrlString = "https://picsum.photos/\(width)/\(height)"
                print(imageUrlString)

                guard let imageUrl:URL = URL(string: imageUrlString) else {
                    return
                }
                image.loadImage(withUrl: imageUrl)
            }
            
            override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)
                getImageUrl()
            }
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                setUpUI()
            }
            
            @objc private func tapButton() {
                print("tapped button")
                getImageUrl()
            }

            private func setUpUI() {
                view.backgroundColor = .white
                
                view.addSubview(image)
                view.addSubview(button)
                
                // create contraints
                let safeArea = view.safeAreaLayoutGuide
                
                button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
                button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
                
                image.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
                image.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
                image.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
                image.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
                
                
            }
        }

        /**Display the image using url**/
        extension UIImageView {
            func loadImage(withUrl url: URL) {
                   DispatchQueue.global().async { [weak self] in
                       if let imageData = try? Data(contentsOf: url) {
                           if let image = UIImage(data: imageData) {
                               DispatchQueue.main.async {
                                   self?.image = image
                               }
                           }
                       }
                   }
               }
        }

    
