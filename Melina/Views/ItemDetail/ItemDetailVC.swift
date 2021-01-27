//
//  ItemDetailVC.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import UIKit

class ItemDetailVC: UIViewController {
    
    var presenter: ItemDetailPresenter?
    
    let titleItemLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let priceLabelLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let imgTopItem: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setContraint()
    }
    
    func setContraint() {
        view.addSubview(titleItemLabel)
        view.addSubview(priceLabelLabel)
        view.addSubview(imgTopItem)

        imgTopItem.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imgTopItem.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imgTopItem.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imgTopItem.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        titleItemLabel.topAnchor.constraint(equalTo: imgTopItem.bottomAnchor, constant: 16).isActive = true
        titleItemLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleItemLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        priceLabelLabel.topAnchor.constraint(equalTo: titleItemLabel.bottomAnchor, constant: 16).isActive = true
        priceLabelLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        priceLabelLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
}

extension ItemDetailVC: ItemDetailView {
    
    func setupItem() {
        presenter?.configureUIItem({ [weak self] (item) in
            self?.titleItemLabel.text =  item.title
            self?.priceLabelLabel.text = item.price.format(.pesos)
        })
    }
    
    func setupImgItem() {
        presenter?.confifurePicture({ [weak self] (pictureData) in
            self?.imgTopItem.transition(toImage: UIImage(data: pictureData) ?? UIImage())
        })
    }
    
    func setupUI() {
        view.backgroundColor = .white
    }
}
