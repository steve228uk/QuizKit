//
//  QKError.swift
//  QuizKit
//
//  Created by Stephen Radford on 12/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

/// Represents errors thrown by QuizKit
///
/// - quizNotSetOnSession: Thrown when a session has been started but a quiz has not been set
enum QKError: Error {
    
    case quizNotSetOnSession
    
}
