//
//  AlbumWorker.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

class AlbumWorker {
    func fetchAlbums(completion: @escaping (Result<[Album], Error>) -> Void){
        let albums = [
        Album(id: 1, title: "Minutes to Midnigth", artist: "Linkin Park"),
        Album(id: 2, title: "Оба", artist: "MAYOT"),
        Album(id: 3, title: "HIStory", artist: "Michael Jackson")
        ]
        completion(.success(albums))
        
    }
}
