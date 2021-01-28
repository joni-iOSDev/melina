//
//  MainVC.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

/**
 Primera `Vista` que se instancia.
 */
class MainVC: UIViewController {

    var presenter: MainPresenter?
    var imageLogo = MLImageView
        .Builder()
        .add(.setImage(nameImg: "mlLogo"))
        .setContentMode(.scaleAspectFit)
        .build()
    
    var time: Timer?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Se agrega timer para simular un loader data
        time = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { [weak self] (aTimer) in
            self?.presenter?.viewDidAppear()
        })
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(imageLogo)
        imageLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        imageLogo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageLogo.widthAnchor.constraint(equalToConstant: 80).isActive = true

    }
}

extension MainVC: MainView {
    
}
