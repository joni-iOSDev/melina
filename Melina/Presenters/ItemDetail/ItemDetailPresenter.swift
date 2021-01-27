//
//  ItemDetailPresenter.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import Foundation

protocol ItemDetailView {
    func setupUI()
    func setupItem()
    func setupImgItem()
}

final class ItemDetailPresenter {
    
    fileprivate var view: ItemDetailView?
    fileprivate var coordinator: MainCoordinator?
    fileprivate var itemId: MLItem?
    
    init(view: ItemDetailView, coordinator: MainCoordinator, itemId: MLItem) {
        self.view = view
        self.coordinator = coordinator
        self.itemId = itemId
    }
    
    func viewDidLoad() {
        view?.setupUI()
        view?.setupItem()
        view?.setupImgItem()
    }
    
    func configureUIItem(_ completionHandler: @escaping ((MLItem) -> Void)) {
        if let itemOk = itemId {
            completionHandler(itemOk)
        }
    }
    
    func confifurePicture(_ completionHandler: @escaping ((Data) -> Void)) {
        if let itemOk = itemId {
            NetworkManager().fetchImgFrom(url: itemOk.thumbnailURL) { (imgData) in
                completionHandler(imgData)
            } error: {
                ()
            // TODO: error manager
            }


        }
    }
    
    
}
