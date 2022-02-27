//
//  AppFlowCoordinator.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import UIKit

class AppFlowCoorinator {
    private let nav: UINavigationController
    private let mediaService: SharedMediaServiceable
    private let mediaDAL: SharedMediaDatabaseable
    private let timeStampDAL: TimeStampServiceable

    init(nav: UINavigationController,
         mediaService: SharedMediaServiceable,
         mediaDAL: SharedMediaDatabaseable,
         timeStampDAL: TimeStampServiceable) {
        
        self.nav = nav
        self.mediaService = mediaService
        self.mediaDAL = mediaDAL
        self.timeStampDAL = timeStampDAL
    }
    
    func start() {
        let viewModel = MediaListViewModel(mediaService: mediaService,
                                           mediaDAL: mediaDAL, timeStampDAL: timeStampDAL)
        
        let vc = MediaListVC(viewModel: viewModel)
        
        vc.coordinator = self
        vc.title = "Media List"
        
        nav.pushViewController(vc, animated: false)
    }
    
    func didOpenImage(media: Media) {
        let vc = DetailMediaVC(media: media)
        
        nav.present(vc, animated: true)
    }
}
