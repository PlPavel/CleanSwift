//
//  ListPresenter.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

class ListPresenter: ListPresentatorProtocol {
    
    
    var interactor: ListInteractorProtocol?
    
    private weak var viewController: MainViewProtocol?
    private let router: ListRouterProtocol
    
    init(viewController: MainViewProtocol? = nil, router: ListRouterProtocol) {
        self.viewController = viewController
        self.router = router
    }
    
    func configureView() {
        interactor?.fetch()
    }
    
    func presentFetchedList(albums: [Album]) {
        viewController?.setAlbums(albums: albums)
    }
    
    func showScreen(album: Album) {
        router.showScreen(album: album)
        
    }
    
}
