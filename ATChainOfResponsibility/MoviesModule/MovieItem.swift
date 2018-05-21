//
//  MovieItem.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

protocol MovieItem {
    var movieID: Int { get }
    var title: String { get }
    var synopsis: String { get}
    var year: Int { get }
}
