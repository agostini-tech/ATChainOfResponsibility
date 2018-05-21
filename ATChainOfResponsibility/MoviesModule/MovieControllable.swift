//
//  MovieControllable.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

protocol MovieControllable {
    init(movieHandler: GetMovieHandler)
    func getMovie(_ movieID: Int, onCompleted: ((MovieItem?) -> ())?)
}
