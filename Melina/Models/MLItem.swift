//
//  MLItem.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation

class MLItem {
    
    let title: String?
    let id: String?
    let price: Currency
    let thumbnailURL: String
    
    init(json: [String:Any]) {
        self.title = json["title"] as? String ?? "Titulo desconocido"
        self.id = json["id"] as? String ?? "Sin Id"
        self.price = json["price"] as? Int ?? 00
        self.thumbnailURL = json["thumbnail"] as? String ?? ""
    }
    
    static func getArray(dictionary: [[String : Any]]) -> [MLItem] {
        var  arrayMLItem = [MLItem]()
        for jsonItem in dictionary {
            let item = MLItem(json: jsonItem)
            arrayMLItem.append(item)
        }
        return arrayMLItem
    }
}
