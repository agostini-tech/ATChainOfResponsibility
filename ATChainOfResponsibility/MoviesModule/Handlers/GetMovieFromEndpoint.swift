//
//  GetMovieFromEndpoint.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class GetMovieFromEndpoint: GetMovieHandler
{
    private let nextHandler: GetMovieHandler?
    
    required init(nextHandler: GetMovieHandler?) {
        self.nextHandler = nextHandler
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        // This should be a real API request
        let success = Bool.random
        
        // Simulate random API failures
        if success {
            let movieItem = APIMovieItem(movieID: movieID, title: "Real Movie", synopsis: "This is, without a doubt, a real movie", year: 1999)
            onCompleted?(movieItem)
        } else {
            nextHandler?.getMovie(movieID, onCompleted: onCompleted)
        }
    }
    
    // For testing only
    private struct APIMovieItem: MovieItem {
        var movieID: Int
        var title: String
        var synopsis: String
        var year: Int
    }
}
