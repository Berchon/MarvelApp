//
//  CharactersEndpoint.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import Alamofire

enum CharactersEndpoint: APIConfiguration {
    case characters(offset: Int, limit: Int, startsWith: String)
    
    case details(characterId: Int)
    
    
    var method: HTTPMethod {
        switch self {
        case .characters, .details:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .characters(let offset, let limit, let startsWith):
            let nameStarsWith: String
            if !startsWith.isEmpty {
                nameStarsWith = startsWith.replacingOccurrences(of: " ", with: "")
//                      nameStar
                  }
            else {
                nameStarsWith = ""
            }
            return  "/v1/public/characters?offset=\(offset)&limit=\(limit)&nameStartsWith=\(nameStarsWith)&\(Authentication.getCredentials())"
        case .details(let characterId):
            return ""
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .characters, .details:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let basePath = try Constants.ProductionServer.basePath.asURL()
        
        var urlRequest = URLRequest(url: basePath.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
