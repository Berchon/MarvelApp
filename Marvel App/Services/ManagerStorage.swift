//
//  ManagerStorage.swift
//  Marvel App
//
//  Created by Luciano Berchon on 21/01/22.
//

import CoreData
import UIKit

public class ManagerStorage {
    
    public static let shared = ManagerStorage()
    var favorites: [StorageData] = []
    
    
    func putCharacter(favorite: FavoriteModel, context: NSManagedObjectContext) -> Bool {
        let newFavorite: StorageData = StorageData(context: context)
        
        newFavorite.id = favorite.id
        newFavorite.name = favorite.name
        newFavorite.image = favorite.image
        
        do {
            try context.save()
            return true
        } catch {
            print("Error saving character in database.")
        }
        return false
    }
    
    
    func deleteCharacter(index: Int, context: NSManagedObjectContext) -> Bool {
        let character = self.favorites[index]
        
        context.delete(character)
        
        do {
            try context.save()
            return true
        } catch {
            print("Error when deleting a character from the database")
        }
        
        return false
    }
    
    
    func transformToFavoriteModel(favorites: [StorageData]) -> [FavoriteModel] {
        var favoritesModelList: [FavoriteModel] = []
        for favorite in favorites {
            let fav = FavoriteModel(id: favorite.id, name: favorite.name!, image: favorite.image!)
            favoritesModelList.append(fav)
        }
        
        return favoritesModelList
    }
    
    
    func getCharacters(context: NSManagedObjectContext) -> [FavoriteModel] {
        let request: NSFetchRequest<StorageData> = StorageData.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            self.favorites = try context.fetch(request)
            return transformToFavoriteModel(favorites: self.favorites)
        } catch {
            print("Error getting character from database.")
        }
        
        return []
    }
}
