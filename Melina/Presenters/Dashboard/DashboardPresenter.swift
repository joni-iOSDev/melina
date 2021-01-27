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

protocol DashboardCellView {
    func setup(price: String, title: String?)
    func setupImg(data: Data)
}

class DashboardPresenterr {
    
    fileprivate var view: DashboardView?
    fileprivate var coordinator: MainCoordinator?
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
            //TODO: Manager error
        }
    }
    
    func itemPressed(in row: Int) {
        let item = items[row]
        coordinator?.goToDetailItem(with: item)
    }
    
    func searchItem(search: String) {
        NetworkManager().search(item: search) { [weak self] (itemsSearched) in
            self?.items = itemsSearched
        } error: {
            ()
        }
    }
}
