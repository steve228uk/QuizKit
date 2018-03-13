//
//  QKSessionDelegate.swift
//  QuizKit
//
//  Created by Stephen Radford on 13/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

public protocol QKSessionDelegate: NSObjectProtocol {
    
    func quizDidStart()
    
    func quizDidEnd()
    
    
}

public extension QKSessionDelegate {
    
    func quizDidStart() { }
    
    func quizDidEnd() { }
    
}
