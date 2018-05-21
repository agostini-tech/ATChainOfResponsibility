//
//  EndOfChain.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

class EndOfChain: GetMovieHandler
{
    required init(nextHandler: GetMovieHandler?) {
        // Stub Implementation
    }
    
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?) {
        print("If you're reading this, it't the end of the road my friend :)")
        onCompleted?(nil)
    }
}
