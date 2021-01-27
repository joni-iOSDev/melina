//
//  LogInPresenter.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation

protocol LogInView {
    func loginTapped()
}

class LoginPresenter {
    
    fileprivate var view: LogInView
    fileprivate var coordinator: MainCoordinator
    
    init(view: LogInView, coordinator: MainCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        
    }
    
    func login(user: String, passwd: String) {
        coordinator.goToDashboard()
    }
}
