//
//  ViewController.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import UIKit

class MediaListVC: UIViewController {
    
    private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16)
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ThumbNailCell.self,
                            forCellWithReuseIdentifier: "thumbnailCell")
        
        return collection
    }()
    
    private var loadingView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.style = .large
        v.startAnimating()
        
        return v
    }()
    
    private var viewModel: MediaListViewModel
    
    var coordinator: AppFlowCoorinator?
    
    init(viewModel: MediaListViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(collection)
        view.addSubview(loadingView)
        
        setupConstraint()

        collection.dataSource = self
        collection.delegate = self
        
        subscribe()
        
        viewModel.fetchMediaList()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collection.leftAnchor.constraint(equalTo: view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor),
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func showLoading(canShow: Bool) {
        collection.isHidden = canShow
        loadingView.isHidden = !canShow
    }
        
    private func subscribe() {
        viewModel
            .onChange
            .onSubscribe { [weak self]  state in
                switch state {
                case .loading:
                    self?.showLoading(canShow: true)
                    
                case .reload:
                    self?.showLoading(canShow: false)
                    self?.collection.reloadData()
                    
                case .showError(let message):
                    self?.coordinator?.showAlert(message: message)
                    
                default: break
                }
            }
    }
}

extension MediaListVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thumbnailCell",
                                                      for: indexPath) as! ThumbNailCell
        
        let model = viewModel.datasource[indexPath.row]
        cell.setConfig(model: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let media = viewModel.datasource[indexPath.row]
        coordinator?.didOpenImage(media: media)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((UIScreen.main.bounds.width - 32) / 3) - 8
        let height = width * 1.2
        
        return CGSize(width: width, height: height)
    }
}

