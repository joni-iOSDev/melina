//
//  ShortcutsExtensions.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation
import UIKit

///Extendemos un  optional para generar codigo mas claros y limpios.
extension Optional {
    var isNil: Bool {
        return self != nil
    }
}

extension UIImageView {
    // visualimos la carga de los items con una pequeña animacion, y obtener una experiancia de carga de data mas amigable, tambien se puede inlcuir un skeleton loader para una proxima implementacion
    func transition(toImage image: UIImage) {
        UIView.transition(with: self, duration: 0.1, options: [.transitionCrossDissolve], animations: { [ weak self ] in
            self?.image = image
        }, completion: nil)
    }
}
