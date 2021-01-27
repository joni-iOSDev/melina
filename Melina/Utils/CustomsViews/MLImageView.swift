//
//  MLImageView.swift
//  Melina
//
//  Created by Joni G. on 1/26/21.
//

import Foundation
import UIKit

class MLImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLogo() {
        
        image = UIImage(named: "logoMelina")
        frame.size = CGSize(width: 45, height: 45)
        contentMode = .scaleToFill
        setup()
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
