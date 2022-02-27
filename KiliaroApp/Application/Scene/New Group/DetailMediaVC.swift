//
//  DetailMediaVC.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import UIKit
import Kingfisher

class DetailMediaVC: UIViewController {
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let vwCaption: CaptionView = {
        let vw = CaptionView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private let vwMain: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 24
        vw.layer.masksToBounds = true
        return vw
    }()
    
    private var btnClose: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.backgroundColor = .black.withAlphaComponent(0.4)
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self,
                      action: #selector(dismissVC),
                      for: .touchUpInside)
        return btn
    }()
    
    private var loadingView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.style = .large
        v.color = .white
        v.startAnimating()
        
        return v
    }()
    
    private var media: Media
    
    init(media: Media) {
        self.media = media
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(vwMain)
        vwMain.addSubview(loadingView)
        vwMain.addSubview(image)
        vwMain.addSubview(vwCaption)
        vwMain.addSubview(btnClose)
        
        setupConstraint()
        loadImage()
        setCreatedBy()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            vwMain.leftAnchor.constraint(equalTo: view.leftAnchor),
            vwMain.rightAnchor.constraint(equalTo: view.rightAnchor),
            vwMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vwMain.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            image.leftAnchor.constraint(equalTo: vwMain.leftAnchor),
            image.rightAnchor.constraint(equalTo: vwMain.rightAnchor),
            image.topAnchor.constraint(equalTo: vwMain.topAnchor),
            image.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor),
            
            vwCaption.leftAnchor.constraint(equalTo: vwMain.leftAnchor),
            vwCaption.rightAnchor.constraint(equalTo: vwMain.rightAnchor),
            vwCaption.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor),
            vwCaption.heightAnchor.constraint(equalToConstant: 55),
            
            loadingView.centerXAnchor.constraint(equalTo: vwMain.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: vwMain.centerYAnchor),
            
            btnClose.topAnchor.constraint(equalTo: vwMain.topAnchor,
                                          constant: 24),
            btnClose.rightAnchor.constraint(equalTo: vwMain.rightAnchor,
                                            constant: -24),
            btnClose.widthAnchor.constraint(equalToConstant: 40),
            btnClose.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func loadImage() {
        let url = URL(string: media.downloadURL)
        image.kf.setImage(with: url)
    }
    
    private func setCreatedBy() {
        let date = media
            .createdAt
            .toDate(format: "yyyy-MM-dd'T'hh:mm:ssZ")
            .medium
        
        vwCaption.setConfig(title: date)
    }
    
    @objc
    private func dismissVC() {
        dismiss(animated: true)
    }
}
