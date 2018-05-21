//
//  DummyGetMovie.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class DummyGetMovie: GetMovieHandler
{
    required init(nextHandler: GetMovieHandler?) {
        // Stub Implementation
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        let movieItem = DummyMovieItem(movieID: movieID, title: "Dummy Movie", synopsis: "This movie will always be the same, and it should be used in your unit tests", year: 2014)
        onCompleted?(movieItem)
    }
    
    // For testing only
    private struct DummyMovieItem: MovieItem {
        var movieID: Int
        var title: String
        var synopsis: String
        var year: Int
    }
}
