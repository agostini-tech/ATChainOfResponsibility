//
//  GetMovieFromSecondaryEndpoint.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class GetMovieFromSecondaryEndpoint: GetMovieHandler
{
    private let nextHandler: GetMovieHandler?
    
    required init(nextHandler: GetMovieHandler?) {
        self.nextHandler = nextHandler
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        // Make an API request to a backup endpoint...
        let success = Bool.random
        
        // Simulate random API failures
        if success {
            let backupMovie = BackupMovieItem(movieID: movieID, title: "Testing It Out", synopsis: "This is a less known movie fetched deep from the depths of a backup server", year: 1955)
            onCompleted?(backupMovie)
        } else {
            nextHandler?.getMovie(movieID, onCompleted: onCompleted)
        }
    }
    
    // For testing only
    private struct BackupMovieItem: MovieItem {
        var movieID: Int
        var title: String
        var synopsis: String
        var year: Int
    }
}
