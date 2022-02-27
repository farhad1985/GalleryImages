//
//  SceneDelegate.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let nav = UINavigationController()
        let coordinator = AppFlowCoorinator(nav: nav,
                                            mediaService: SharedMediaService(),
                                            mediaDAL: SharedMediaDAL(),
                                            timeStampDAL: TimeStampDAL())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        coordinator.start()
    }
}
