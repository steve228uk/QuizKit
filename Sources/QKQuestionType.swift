//
//  QKQuestionType.swift
//  QuizKit
//
//  Created by Stephen Radford on 12/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

/// Represents the types of questions in a quiz
///
/// - singleAnswer: Single answer would use a text field
/// - multipleChoice: Multiple choice of text responses
/// - imageChoice: Miltiple choice of image responses
public enum QKQuestionType {
    
    case singleAnswer
    case multipleChoice
    case imageChoice
    
}
