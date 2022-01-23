//
//  characterModel.swift
//  Marvel App
//
//  Created by Luciano Berchon on 13/01/22.
//

import Foundation

struct CharacterModel: Codable {
    var id: Int
    var name: String
    var description: String
    var verifiedDescription: String {
        return !description.isEmpty ? description : "There is no description for this character."
    }
    var thumbnail: ThumbnailModel
}
