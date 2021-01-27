//
//  Router.swift
//  Melina
//
//  Created by Joni G. on 1/22/21.
//

import Foundation
import Alamofire

public typealias ErrorResponse = ()->Void
public typealias Response = ([[String:Any]])->Void


protocol NetworkRouter {
    ///Asociamos un tipo
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint,
                 onResponse: @escaping Response,
                 onErrorResponse: @escaping ErrorResponse)
    
    func cancel()
    
    func getPictureFrom(url: String, imgDataResponse: @escaping ((Data)->Void), onError: ErrorResponse)
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    func request(_ route: EndPoint,
                 onResponse: @escaping Response,
                 onErrorResponse: @escaping ErrorResponse) {
        
        let urlRequest = route.baseURL.appendingPathComponent(route.path)
        print("REQUEST ==>>> \(urlRequest)")
        
        let alamofireRequest = AF.request(urlRequest, method: route.httpMerthod,
                                          parameters: route.params,
                                          headers: route.headers)
        
        alamofireRequest.responseJSON { (response) in
            
            if let jsonResponse = response.value as? [String:Any],
               let jsonResult = jsonResponse["results"] as? [[String:Any]]{
                print("RESPONSE => \(jsonResponse)")
                onResponse(jsonResult)
            }
        }
    }
    
    func cancel() {
        
    }
    
    func getPictureFrom(url: String, imgDataResponse: @escaping ((Data) -> Void), onError: () -> Void) {
        print("REQUEST ==>>> \(url)")
        let alamofireRequest = AF.request(url, method: .get)
        
        alamofireRequest.response { (response) in
            
            if let dataR = response.data {
                imgDataResponse(dataR)
            }
        }
    }
    
}
