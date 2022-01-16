//
//  ResponseData.swift
//  Marvel App
//
//  Created by Luciano Berchon on 14/01/22.
//

import Foundation

struct ResponseDataModel: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [CharacterModel]
}
