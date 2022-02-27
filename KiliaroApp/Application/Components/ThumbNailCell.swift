//
//  ThumbNailCell.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import UIKit
import Kingfisher

class ThumbNailCell: UICollectionViewCell {
    
    private var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()
    
    private var vwLoading: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .gray.withAlphaComponent(0.1)
        vw.layer.cornerRadius = 8
        vw.layer.masksToBounds = true
        return vw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(vwLoading)
        contentView.addSubview(image)
        
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConfig(model: Media) {
        let link = model.thumbnailURL + "?w=200"
        let url = URL(string: link)
        image.kf.setImage(with: url)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            vwLoading.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            vwLoading.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            vwLoading.topAnchor.constraint(equalTo: contentView.topAnchor),
            vwLoading.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}
