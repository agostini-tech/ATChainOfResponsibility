//
//  MovieChainBuilder.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class MovieChainBuilder
{
    static func mainChain() -> GetMovieHandler {
        let endOfChain = EndOfChain(nextHandler: nil)
        let secondaryEndpoint = GetMovieFromSecondaryEndpoint(nextHandler: endOfChain)
        let primaryEndpoint = GetMovieFromEndpoint(nextHandler: secondaryEndpoint)
        let secondaryCache = GetMovieFromDisk(nextHandler: primaryEndpoint)
        let primaryCache = GetMovieFromCache(nextHandler: secondaryCache)
        
        return primaryCache
    }
    
    static func dummyChain() -> GetMovieHandler {
        return DummyGetMovie(nextHandler: nil)
    }
}
