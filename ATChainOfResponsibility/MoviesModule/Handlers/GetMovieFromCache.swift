//
//  GetMovieFromCache.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class GetMovieFromCache: GetMovieHandler
{
    private let nextHandler: GetMovieHandler?
    
    required init(nextHandler: GetMovieHandler?) {
        self.nextHandler = nextHandler
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        // You could use NSCache here or a Dictionary... What ever floats your boat.
        let success = Bool.random
        
        // Not all movies will be cached, so let's simulate some failures.
        if success {
            let movieItem = CachedMovieItem(movieID: movieID, title: "Very Fast Movie", synopsis: "You wanted a movie really fast... Well, you got it", year: 2018)
            onCompleted?(movieItem)
        } else {
            nextHandler?.getMovie(movieID) { item in
                if item != nil {
                    // Since we didn't have the movie cached in the first place, maybe we'll cache it if the next responder has it.
                }
                onCompleted?(item)
            }
        }
    }
    
    // For testing only
    private struct CachedMovieItem: MovieItem {
        var movieID: Int
        var title: String
        var synopsis: String
        var year: Int
    }
}
