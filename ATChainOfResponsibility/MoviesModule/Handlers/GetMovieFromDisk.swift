//
//  GetMovieFromDisk.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class GetMovieFromDisk: GetMovieHandler
{
    private let nextHandler: GetMovieHandler?
    
    required init(nextHandler: GetMovieHandler?) {
        self.nextHandler = nextHandler
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        // Here you will fetch a movie from disk
        let success = Bool.random
        
        // Let's say there's a 50-50 chance that the movie is actually cached
        if success {
            let movieItem = DiskMovieItem(movieID: movieID, title: "Cached Movie", synopsis: "This movie has been fetched from the cache. There's no knowing how old this thing is", year: 1919)
            onCompleted?(movieItem)
        } else {
            nextHandler?.getMovie(movieID) { item in
                if item != nil {
                    // You probably want to write this item to the disk so you can fetch it in the future
                }
                onCompleted?(item)
            }
        }
    }
    
    // For testing only
    private struct DiskMovieItem: MovieItem {
        var movieID: Int
        var title: String
        var synopsis: String
        var year: Int
    }
}
