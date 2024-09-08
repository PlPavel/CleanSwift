//
//  Configurator.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

struct Configurator {
    func configure(with viewController: ViewController){
        let router = ListRouter(viewController: viewController)
        let presenter = ListPresenter(viewController: viewController, router: router)
        let interactor = ListInteractor(presenter: presenter)
        
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}

