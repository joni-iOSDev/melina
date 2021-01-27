//
//  ShortcutsExtensions.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation
import UIKit

///Extending optional
extension Optional {
    var isNil: Bool {
        return self != nil
    }
}

extension UIImageView {
    
    func transition(toImage image: UIImage) {
        UIView.transition(with: self, duration: 0.1, options: [.transitionCrossDissolve], animations: {
            self.image = image
        }, completion: nil)
    }
}
