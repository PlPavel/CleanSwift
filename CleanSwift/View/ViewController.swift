//
//  ViewController.swift
//  CleanSwift
//
//  Created by Pavel Plyago on 30.07.2024.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setAlbums(albums: [Album])
}

class ViewController: UIViewController {
    
    var presenter: ListPresentatorProtocol?
    private let configurate = Configurator()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var albums: [Album] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Albums"
        configurate.configure(with: self)
        presenter?.configureView()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showScreen(album: albums[indexPath.row])
    }
    
}

extension ViewController: MainViewProtocol {
    func setAlbums(albums: [Album]) {
        DispatchQueue.main.async {
            self.albums = albums
            self.tableView.reloadData()
        }
    }
    
    
}

