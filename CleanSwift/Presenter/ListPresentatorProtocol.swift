//
//  ListPresentatorProtocol.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import Foundation

protocol ListPresentatorProtocol {
    func presentFetchedList(albums: [Album])
    func configureView()
    func showScreen(album: Album)
}
