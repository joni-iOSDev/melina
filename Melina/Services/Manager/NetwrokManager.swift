//
//  NetwrokManager.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation

struct NetworkManager {
    fileprivate let routerItems = Router<ItemsEndPoint>()
        
    func search(item: String,
                response: @escaping ((Bool) -> Void),
                error: @escaping ErrorResponse) {
        routerItems.request(.search(item)) {
            response(true)
        } errorResponse: {
            error()
        }

    }
}
