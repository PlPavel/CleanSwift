//
//  ListRouter.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

class ListRouter: ListRouterProtocol {
    
    private weak var viewController: ViewController?
    
    init(viewController: ViewController? = nil) {
        self.viewController = viewController
    }
    
    func showScreen(album: Album) {
        let nextViewController = InfViewController()
        nextViewController.album = album
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}
