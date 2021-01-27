//
//  NetwrokManager.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation

///
struct NetworkManager {
    fileprivate let routerItems = Router<ItemsEndPoint>()
        
    func search(item: String, response: @escaping (([MLItem]) -> Void), error: @escaping ErrorResponse) {
        
        routerItems.request(.search(item)) { (responseApi) in
            let arrayItem = MLItem.getArray(dictionary: responseApi)
            response(arrayItem)
        } onErrorResponse: {
            ()
        }
    }
    
    func fetchImgFrom(url: String, response: @escaping ((Data) -> Void), error: @escaping ErrorResponse) {
        routerItems.getPictureFrom(url: url, imgDataResponse: response, onError: error)
    }
}
