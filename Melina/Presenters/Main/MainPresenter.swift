//
//  MainPresenter.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation

protocol MainView {
    
}

class MainPresenter {
    
    fileprivate var view: MainView
    fileprivate var coordinator: MainCoordinator
    
    required init(view: MainView, coordinator: MainCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        coordinator.goToLogin()
    }
}
