//
//  Bool+Random.swift
//  ATChainOfResponsibility
//
//  Created by Dejan on 20/05/2018.
//  Copyright © 2018 Dejan. All rights reserved.
//

import Foundation

extension Bool {
    static var random: Bool {
        return arc4random_uniform(2) == 0
    }
}
