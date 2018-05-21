//
//  GetMovieHandler.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

protocol GetMovieHandler {
    init(nextHandler: GetMovieHandler?)
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?)
}
