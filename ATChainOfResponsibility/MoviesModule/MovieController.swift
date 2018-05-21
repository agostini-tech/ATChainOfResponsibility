//
//  MovieController.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class MovieController: MovieControllable {
    // This is your main controller for the movie. You'll probably do some fancy business logic here.
    
    private let movieHandler: GetMovieHandler
    
    required init(movieHandler: GetMovieHandler) {
        self.movieHandler = movieHandler
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        self.movieHandler.getMovie(movieID, onCompleted: onCompleted)
    }
}
