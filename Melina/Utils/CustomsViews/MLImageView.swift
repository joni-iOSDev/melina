//
//  MLImageView.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

// Implemento un builder pattern para mejorar la reutilizacion de los componentes visuales de forma cross a los equipos, y asi mantener un codigo mas ordenado por todos.
class MLImageView: UIImageView {

    ///Constructor del custom ImageView
    class Builder {
        ///
        private(set) var imgView = MLImageView()
       
        enum Img {
            case logo
            case setImage(nameImg: String)
        }
        
        func setup() {
            imgView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        @discardableResult
        func add(_ image: Img) -> Builder {
            
            switch image {
            case .setImage(nameImg: let nameImg):
                imgView.image = UIImage(named: nameImg)
            default:
                imgView.image = UIImage(named: "logoMelina")
            }
            return self
        }
        
        @discardableResult
        func size() -> Builder {
            imgView.frame.size = CGSize(width: 45, height: 45)
            return self
        }
        
        @discardableResult
        func setContentMode(_ type: ContentMode) -> Builder {
            imgView.contentMode = type
            return self
        }
        
        func build() -> MLImageView {
            setup()
            return imgView
        }
    }
}
