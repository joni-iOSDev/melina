//
//  Environment.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation

public enum NetworkEnvironment {
    case mock
    case prod
    case develop
    
    func getURL() -> String {
        switch self {
        case .develop:
            return ""
        case .mock:
            return ""
        case .prod:
            return "https://api.mercadolibre.com/sites/MLA"
        }
    }
}
