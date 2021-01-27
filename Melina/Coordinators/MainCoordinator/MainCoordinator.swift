//
//  MainCoordinator.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit


class MainCoordinator: CoordinatorProtocol {
    
    fileprivate var window: UIWindow

    var navigationController: UINavigationController

    init(scene: UIWindowScene  ) {
        self.navigationController = UINavigationController()
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        setupCoordinator()
    }
    
    func start() {
        goToMain()
    }
    
    func setupCoordinator() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    public typealias completionHandlerNav = (() -> Void)
    public typealias ParamsNavigation = ()
        
    public func navigate(toVC: UIViewController, presentation: presentationNav, completion: completionHandlerNav?) {
        
        switch presentation {
        
        case .present(let animated):
            navigationController.present(toVC, animated: animated, completion: completion)
            
        case .push(let animated):
            navigationController.pushViewController(toVC, animated: animated)
            
        case .root:
            window.rootViewController = UINavigationController(rootViewController: toVC)
            
        case .none(let isHiddenNav, let isAnimated):
            navigationController = UINavigationController(rootViewController: toVC)
            navigationController.setNavigationBarHidden(isHiddenNav, animated: isAnimated)
            navigationController.viewControllers = [toVC]
            window.rootViewController = navigationController
        }
    }
    
    public enum presentationNav {
        case push(animate: Bool = true)
        case present(animate: Bool = true)
        case root
        case none(isHiddenNav: Bool = false, animated: Bool = true)
    }
}

extension MainCoordinator {
    
    func goToMain() {
        let mainVC = MainVC()
        mainVC.presenter = MainPresenter(view: mainVC, coordinator: self)
        navigate(toVC: mainVC, presentation: .none(isHiddenNav: true, animated: false), completion: nil)
    }
    
    func goToDashboard() {
        let dashboardVC = DashboardVC()
        dashboardVC.presenter = DashboardPresenterr(view: dashboardVC, coordinator: self)
        dashboardVC.modalPresentationStyle = .fullScreen
        navigate(toVC: dashboardVC, presentation: .none(isHiddenNav: false, animated: false), completion: nil)
    }
    
    func goToLogin() {
        let loginVC = LogInVC()
        loginVC.presenter = LoginPresenter(view: loginVC, coordinator: self)
        navigate(toVC: loginVC, presentation: .none(), completion: nil)
    }
    
    func goToDetailItem(with item: MLItem) {
        let itemDetailVC = ItemDetailVC()
        itemDetailVC.presenter = ItemDetailPresenter(view: itemDetailVC, coordinator: self, itemId: item)
        navigate(toVC: itemDetailVC, presentation: .push(), completion: nil)
    }
}
