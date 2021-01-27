//
//  EndPointType.swift
//  Melina
//
//  Created by Joni G. on 1/22/21.
//

import Alamofire

protocol EndPointType {
    var environment: NetworkEnvironment { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMerthod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var params: Parameters? { get }
}
