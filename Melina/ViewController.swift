//
//  ViewController.swift
//  Melina
//
//  Created by Joni G. on 1/22/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        checkEndpoint()
    }
    
    func checkEndpoint() {
        NetworkManager().search(item: "iPhone") { (responseBool) in
            print("ya tenemos los resultados ")
        } error: {
            //
        }

    }
}

