//
//  InfViewController.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import UIKit

class InfViewController: UIViewController {
    
    var album: Album?
    private lazy var nameAlbum: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = album?.title
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameArtist: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = album?.artist
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(nameAlbum)
        view.addSubview(nameArtist)
        NSLayoutConstraint.activate([
            nameAlbum.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameAlbum.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameArtist.centerYAnchor.constraint(equalTo: nameAlbum.centerYAnchor),
            nameArtist.leadingAnchor.constraint(equalTo: nameAlbum.trailingAnchor, constant: 20)
        ])
    }

}
