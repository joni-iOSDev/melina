//
//  CoordinatorProtocol.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

///
protocol CoordinatorProtocol {
    
    /// Cada coordinator tiene su propio root controller para navegarr entre pantallas
    var navigationController: UINavigationController { get set }
    
    /// Start es el método para iniciar la primera pantalla
    func start()
    
}
