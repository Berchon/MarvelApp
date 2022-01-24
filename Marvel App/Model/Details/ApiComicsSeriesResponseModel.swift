//
//  ApiComicsSeriesResponseModel.swift
//  Marvel App
//
//  Created by Luciano Berchon on 18/01/22.
//

import Foundation

struct ApiComicsSeriesResponseModel: Codable {
    let code: Int
    let status: String
    let data: ResponseComicsSeriesDataModel
}
