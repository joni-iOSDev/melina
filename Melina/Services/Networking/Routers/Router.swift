//
//  Router.swift
//  Melina
//
//  Created by Joni G. on 1/22/21.
//

import Foundation
import Alamofire

public typealias ErrorResponse = ()->Void
public typealias Response = ()->Void


protocol NetworkRouter {
    ///Asociamos un tipo
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint,
                 onResponse: @escaping Response,
                 errorResponse: @escaping ErrorResponse)
    
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    func request(_ route: EndPoint,
                 onResponse: @escaping Response,
                 errorResponse: @escaping ErrorResponse) {
        
        let urlRequest = route.baseURL.appendingPathComponent(route.path)
        print("REQUEST ==>>> \(urlRequest)")
        
        
        
        let alamofireRequest = AF.request(urlRequest,
                                          method: route.httpMerthod,
                                          parameters: route.params,
                                          headers: route.headers,
                                          interceptor: nil,
                                          requestModifier: nil)
        alamofireRequest.responseJSON { (response) in
            if let res = response.value as? [String : Any] {
                print("RESPONSE ===>>> \(res)")
                onResponse()
            }
        }
    }
    
    func cancel() {
        
    }
    
    
    
}
