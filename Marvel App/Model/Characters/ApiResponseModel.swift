//
//  ApiResponse.swift
//  Marvel App
//
//  Created by Luciano Berchon on 13/01/22.
//

import Foundation

struct ApiResponseModel: Codable {
    let code: Int
    let status: String
    let data: ResponseDataModel
}
