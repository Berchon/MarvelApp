//
//  ApiResponse.swift
//  Marvel App
//
//  Created by Luciano Berchon on 13/01/22.
//

import Foundation

struct ApiResponse: Codable {
    let code: Int
    let status: String
    let data: ResponseData
}
