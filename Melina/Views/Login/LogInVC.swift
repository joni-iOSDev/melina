//
//  LogInVC.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import UIKit

class LogInVC: UIViewController {
    
    // TODO: Podemos generar vistas custom con un patron builder para mejorar la reultilizacion de estos componentes. 
    let userNameLabel: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textAlignment = .center
        field.placeholder = LogInConstants.usernamePlaceholder
        return field
    }()
    
    let passwdLabel: UITextField = {
        let field = UITextField()
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = LogInConstants.passwdPlaceholder
        return field
    }()
    
    let loginButton: UIButton = {
        let bttn = UIButton()
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.setTitle(LogInConstants.loginButtonTitle, for: .normal)
        bttn.setTitle(LogInConstants.loginButtonTitle, for: .highlighted)
        bttn.setTitleColor(.blue, for: .normal)
        bttn.setTitleColor(.cyan, for: .highlighted)
        bttn.backgroundColor = .lightGray
        return bttn
    }()
    // MARK: - PRESENTER
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setViews()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = LogInConstants.titleView
        view.backgroundColor = .white
    }
    
    func setViews() {
        view.addSubview(userNameLabel)
        view.addSubview(passwdLabel)
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        // MARK: - SET CONSTRAINTS
        // MARK: - USERNAME CONSTRAINT
        userNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -40).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // MARK: - PASSWORD CONSTRAINT
        passwdLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 40).isActive = true
        passwdLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        passwdLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwdLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // MARK: - LOGIN BUTTON CONSTRAINT
        loginButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 100).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.widthAnchor.constraint(equalTo: passwdLabel.widthAnchor).isActive = true

    }
    
}

extension LogInVC: LogInView {
    
    @objc func loginTapped() {
        presenter?.login(user: "", passwd: "")
    }
    
    
}
