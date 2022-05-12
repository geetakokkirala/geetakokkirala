//
//  SceneDelegate.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(windowScene: scene as! UIWindowScene)
        let vc = PostViewController(viewModel: PostViewModel())
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }

}

