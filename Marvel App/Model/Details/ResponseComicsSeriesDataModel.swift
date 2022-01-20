//
//  ResponseComicsSeriesDataModel.swift
//  Marvel App
//
//  Created by Luciano Berchon on 18/01/22.
//

import Foundation

struct ResponseComicsSeriesDataModel: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [ComicsSeriesModel]
}
