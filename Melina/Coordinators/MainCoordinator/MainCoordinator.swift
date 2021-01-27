//
//  MainCoordinator.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

/**
 Desde esta instancia podemos hacer distintas validaciones:
 - Enviar al usuario a una vista desea por determinado producto y no delegar  la responsabilidad al AppDelegate
 
 # Coordinator:
 - Maneja toda la navegacion:
 - Se puede tener mas de un coordinator, por ejemplo uno por cada flujo en la app,
     - Ejemplo: [Login - SignUp - Recovery Password] // [User - ConfigProfile ]
 */
class MainCoordinator: CoordinatorProtocol {
    
    fileprivate var window: UIWindow

    var navigationController: UINavigationController

    init(scene: UIWindowScene  ) {
        self.navigationController = UINavigationController()
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        setupCoordinator()
    }
    // MARK: - INICIO DE FLUJO
    func start() {
        // Podemos validar y enviar a cualquier otra vista
        //Ejemplo: isLogged ? goToMain() : goToWelcome()
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

// MARK: - Centro de navigación
// Instanciamos Presenter con un coordinator, dejando la responsabilidad de navigacion al mismo y no al VC, obtenemos de esta manera que el VC solo interactue con el usuario y no se encargue de otra cuestion mas que recibir eventos.
extension MainCoordinator {
    // MARK: - GO TO
    // MARK: - Main
    func goToMain() {
        let mainVC = MainVC()
        mainVC.presenter = MainPresenter(view: mainVC, coordinator: self)
        navigate(toVC: mainVC, presentation: .none(isHiddenNav: true, animated: false), completion: nil)
    }
    // MARK: - DASHBOARD
    func goToDashboard() {
        let dashboardVC = DashboardVC()
        dashboardVC.presenter = DashboardPresenterr(view: dashboardVC, coordinator: self)
        dashboardVC.modalPresentationStyle = .fullScreen
        navigate(toVC: dashboardVC, presentation: .none(isHiddenNav: false, animated: false), completion: nil)
    }
    // MARK: - LOGIN
    func goToLogin() {
        let loginVC = LogInVC()
        loginVC.presenter = LoginPresenter(view: loginVC, coordinator: self)
        navigate(toVC: loginVC, presentation: .none(), completion: nil)
    }
    // MARK: - DETAIL ITEM
    func goToDetailItem(with item: MLItem) {
        let itemDetailVC = ItemDetailVC()
        itemDetailVC.presenter = ItemDetailPresenter(view: itemDetailVC, coordinator: self, itemId: item)
        navigate(toVC: itemDetailVC, presentation: .push(), completion: nil)
    }
}
