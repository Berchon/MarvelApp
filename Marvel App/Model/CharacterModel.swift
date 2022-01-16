//
//  characterModel.swift
//  Marvel App
//
//  Created by Luciano Berchon on 13/01/22.
//

import Foundation

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let description: String
    var verifiedDescription: String {
        return !description.isEmpty
        ? description
        : "There is no description for this character."
    }
    let thumbnail: ThumbnailModel
}
