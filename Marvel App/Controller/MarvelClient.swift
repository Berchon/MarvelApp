//
//  MarvelClient.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import Alamofire

class MarvelClient {
    @discardableResult
    private static func performRequest(route: MarvelEndpoint, completion: @escaping (DataResponse<Any, AFError>?)-> Void) -> DataRequest{
        
        return AF.request(route)
            .validate()
            .responseJSON { (response: DataResponse<Any, AFError>?) in
            completion(response)
        }
    }
    
    static func getCharacters(offset: Int, limit: Int, startsWith: String, completion: @escaping (ApiResponseModel?, Error?) -> Void) {
        performRequest(route: .characters(offset: offset, limit: limit, startsWith: startsWith)) { response in
            if response?.error == nil {
                if let data = response?.data, let utf8Text = String(data: data, encoding: .utf8){
                    let json = utf8Text.data(using: .utf8)
                    do {
                        let decoder = JSONDecoder()
                        let decodeJson = try decoder.decode(ApiResponseModel.self, from: json!)
                        completion(decodeJson, nil)
                    } catch {
                        //treat error here
                        completion(nil, error)
                    }
                }
            }
            else {
                //treat error here
                
            }
        }
    }
}
