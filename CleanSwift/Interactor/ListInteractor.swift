//
//  ListInteractor.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

class ListInteractor: ListInteractorProtocol {
    let presenter: ListPresentatorProtocol?
    let worker = AlbumWorker()
    
    init(presenter: ListPresentatorProtocol?) {
        self.presenter = presenter
    }
    
    func fetch() {
        worker.fetchAlbums {[weak self] result in
            switch result {
            case .success(let albums):
                self?.presenter?.presentFetchedList(albums: albums)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
}
