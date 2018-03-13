//
//  Array + Shuffled.swift
//  QuizKit
//
//  Created by Stephen Radford on 12/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for i in indices.reversed() {
            let j = arc4random_uniform( numericCast(i+1) )
            swapAt(i, numericCast(j))
        }
    }
    
    func shuffled() -> Array {
        var newArray = self
        newArray.shuffle()
        return newArray
    }
    
}
