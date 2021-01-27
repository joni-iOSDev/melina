//
//  TypeAliases.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import Foundation

typealias Pesos = Int

extension Pesos {
    func format(_ currency: Currency) -> String {
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
    
    enum Currency {
        case pesos
        case dolar
    }
}
