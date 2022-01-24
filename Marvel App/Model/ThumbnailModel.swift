//
//  thumbnail.swift
//  Marvel App
//
//  Created by Luciano Berchon on 13/01/22.
//

import Foundation

struct ThumbnailModel: Codable {
    var path: String
    var ext: String
    var url: String{
        return path + "." + ext
    }

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

