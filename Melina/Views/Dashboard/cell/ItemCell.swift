//
//  ItemCell.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import UIKit

class ItemCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let imgItem: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imgItem.image = nil
    }
    
    func setContraint() {
        self.addSubview(titleLabel)
        self.addSubview(imgItem)
        
        imgItem.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        imgItem.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imgItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgItem.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imgItem.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
}

extension ItemCell: DashboardCellView {
    func setupImg(data: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.imgItem.transition(toImage: UIImage(data: data) ?? UIImage())
        }
    }

    func setup(price: String, title: String?) {
        setContraint()
        titleLabel.text = title
    }
    
}
