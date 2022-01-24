//
//  ComicsModel.swift
//  Marvel App
//
//  Created by Luciano Berchon on 18/01/22.
//

import Foundation

struct ComicsSeriesModel: Codable {
    let id: Int
    let title: String
    let thumbnail: ThumbnailModel
}
