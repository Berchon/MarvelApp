//
//  CharactersEndpoint.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import Alamofire

enum MarvelEndpoint: APIConfiguration {
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
            
            var urlComponents = URLComponents(string: Constants.ProductionServer.basePath)
            urlComponents?.path = Constants.ProductionServer.charactersPath
            urlComponents?.queryItems = [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit))
            ]
            
            if !startsWith.isEmpty {
                let queryItem = URLQueryItem(name: "nameStartsWith", value: startsWith.replacingOccurrences(of: " ", with: ""))
                urlComponents?.queryItems?.append(queryItem)
            }
            urlComponents?.queryItems! += Authentication.getCredentials()
            
            let urlRequest = URLRequest(url: (urlComponents?.url)!)
            
            return urlRequest.url!.absoluteString
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
        let urlComponents = URLComponents(string: path)

        var urlRequest = URLRequest(url: (urlComponents?.url)!)
        
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
