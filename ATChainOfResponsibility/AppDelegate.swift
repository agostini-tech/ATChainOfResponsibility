//
//  AppDelegate.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        testMoviesController()
        
        return true
    }

    private func testMoviesController() {
        let movieController = MovieController(movieHandler: MovieChainBuilder.mainChain())
        
        for i in 0...10000 {
            movieController.getMovie(i) { (item) in
                print("movie item: \(item?.title)")
            }
        }
    }
}

