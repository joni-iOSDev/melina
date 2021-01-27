//
//  MainVC.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {

    var presenter: MainPresenter?
    var imageLogo = MLImageView(frame: .zero)
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        imageLogo.setupLogo()
        view.addSubview(imageLogo)
        imageLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}

extension MainVC: MainView {
    
}
