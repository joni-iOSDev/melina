//
//  DashboardPresenter.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import Foundation

protocol DashboardView {
    func setupUI()
    func refreshData()
}
// Protocol para configurar las celdas.
protocol DashboardCellView {
    func setup(price: String, title: String?)
    func setupImg(data: Data)
}

class DashboardPresenterr {
    
    // Marcmos como filePrivate para que solo sea usable solo desde este file.
    fileprivate var view: DashboardView?
    fileprivate var coordinator: MainCoordinator?
    
    // Con este observer evitamos hacer reloadData desde otros metodos.
    private var items: [MLItem] = [] {
        didSet {
            view?.refreshData()
        }
    }
    
    var itemsCount: Int {
        return items.count
    }
    
    init(view: DashboardView, coordinator: MainCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        view?.setupUI()
    }
    
    func configure(_ cell: DashboardCellView, in row: Int) {
        let item = items[row]
        cell.setup(price: item.price.format(.pesos), title: item.title)
        NetworkManager().fetchImgFrom(url: item.thumbnailURL) { (imageData) in
            cell.setupImg(data: imageData)
        } error: {
            ()
            //TODO: Error Manager
        }
    }
    
    func itemPressed(in row: Int) {
        let item = items[row]
        coordinator?.goToDetailItem(with: item)
    }
    
    // Evitamos memory leak con [weak self]
    func searchItem(search: String) {
        NetworkManager().search(item: search) { [weak self] (itemsSearched) in
            self?.items = itemsSearched
        } error: {
            ()
            //TODO: Error Manager
        }
    }
}
