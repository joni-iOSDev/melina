//
//  ItemsEndPoints.swift
//  Melina
//
//  Created by Joni G. on 1/24/21.
//

import Foundation
import Alamofire

public enum ItemsEndPoint {
    case search(_ item: String)
}

extension ItemsEndPoint: EndPointType {
    
    
    var environment: NetworkEnvironment {
        return .prod
    }
    
    var baseURL: URL {
        guard let url = URL(string: "\(environment.getURL())") else {
            fatalError("Error environment")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    var httpMerthod: HTTPMethod {
        switch self {
        //Por defecto hacemos GET, sino tenemos la opcion por cada endpoint de hacer el return por el deseado
        // example
        // case .search:
        // return .post
        default:
            return .get
        }
    }
    
    var params: Parameters? {
        switch self {
        case .search(let item):
            let params = ["q": item]
            return params
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
}
