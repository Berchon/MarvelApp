//
//  ConstantsRequest.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let basePath = "https://gateway.marvel.com"
        static let charactersPath = "/v1/public/characters"
    }
    
    struct APIParameters {
        static let publicKey = "c1ceb00bf64e0dbf4bf011e75cda7dc7"
        static let privateKey = "d8eac4245f1711423777511aab03dfec8482c836"
    }
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}


enum ContentType: String {
    case json = "application/json"
}
