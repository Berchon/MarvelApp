//
//  APIConfiguration.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
