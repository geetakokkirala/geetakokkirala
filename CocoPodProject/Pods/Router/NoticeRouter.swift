//
//  NoticeRouter.swift
//  Pods-CocoPodProject
//
//  Created by Admin on 14/04/2022.
//

import Foundation
import UIKit

class NoticeRouter:PresenterToRouterProtocol{
    
    static func createModule() -> NoticeViewController {
        let view = mainstoryboard.instantiateViewControler(withIdentifier: "MyViewController") as! NoticeViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    static var mainstoryboard: UIStoryboard
    return UIStoryboard(name:"Main",bundle: Bundle.main)
}
func pushToMovieScreen(navigationController navigationController:UINavigationController) {
    let movieModue = MovieRouter.createMovieModule()
    navigationController.pushViewController(movieModue,animation: true)
}
}
