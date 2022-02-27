//
//  MediaListViewModel.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

class MediaListViewModel {
    
    enum State {
        case loading
        case reload
        case showError
        case noData
    }
    
    private let repo: MediaRepository
    
    var onChange = Publisher<State>()
    var datasource: [Media] = []
    
    init(mediaService: SharedMediaServiceable,
         mediaDAL: SharedMediaDatabaseable,
         timeStampDAL: TimeStampServiceable) {
        
        repo = MediaRepository(mediaService: mediaService,
                               mediaDAL: mediaDAL,
                               timeStampDAL: timeStampDAL)
    }
    
    func fetchMediaList() {
        let id = "djlCbGusTJamg_ca4axEVw"
        
        onChange.onNext(value: .loading)
        
        repo.fetchMediaList(id: id) { [weak self] result in
            
            switch result {
            case .success(let value):
                self?.datasource = value
                self?.onChange.onNext(value: .reload)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
