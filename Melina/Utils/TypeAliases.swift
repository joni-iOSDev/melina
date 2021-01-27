//
//  TypeAliases.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import Foundation
//
/// Un typa alias para  exnteder y ofrecer un codigo mejor reutilizable.
typealias Currency = Int


extension Currency {
    // Agregamos un currency format.
    func format(_ currency: TypeCurrency) -> String {
        let numberFormarter = NumberFormatter()
        numberFormarter.numberStyle = .currency
        numberFormarter.locale = Locale(identifier:  "\(currency == .pesos ? "es_ARG" : "en_US")")
        let nsNumber = NSNumber(integerLiteral: self)
        let number = numberFormarter.string(from: nsNumber)
        if let price = number {
            let priceString = "\(String(describing: price))"
            return priceString
        }
        return ""
    }
    
    enum TypeCurrency {
        case pesos
        case dolar
    }
}
