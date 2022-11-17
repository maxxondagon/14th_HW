//
//  Model.swift
//  14th-HW
//
//  Created by Максим Солобоев on 01.11.2022.
//

import UIKit

struct CollectionModel {
    var title: String
    var count: String? = "666"
    var image: UIImage?
    var icon: UIImage?
}

extension CollectionModel {
    static func getInstances() -> [[CollectionModel]] {
        return [
            
            // My Albums
            [CollectionModel(title: "Recents", count: "15", image: UIImage(named: "image")),
             CollectionModel(title: "Favourites", image: UIImage(named: "image-2")),
             CollectionModel(title: "Instagram", image: UIImage(named: "image-3")),
             CollectionModel(title: "Snapseed", image: UIImage(named: "image-4")),
             CollectionModel(title: "Twitter", image: UIImage(named: "image-5")),
             CollectionModel(title: "FaceApp", image: UIImage(named: "image-6")),
             CollectionModel(title: "Lightroom", image: UIImage(named: "image-7")),
             CollectionModel(title: "Telegram", image: UIImage(named: "image-8")),
             CollectionModel(title: "InShot", image: UIImage(named: "image-9"))],
            
            // People & Places
            [CollectionModel(title: "People", image: UIImage(systemName: "seal")),
             CollectionModel(title: "Places", image: UIImage(systemName: "key"))],
            
            // Media Types
            [CollectionModel(title: "Videos", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Selfies", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Live Photos", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Screenshots", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Screen Recordings", icon: UIImage(systemName: "house"))],
            
            // Utilities
            [CollectionModel(title: "Imports", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Hidden", icon: UIImage(systemName: "house")),
             CollectionModel(title: "Recently Deleted", icon: UIImage(systemName: "house")),]
        ]
    }
}
