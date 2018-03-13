//
//  QKQuiz.swift
//  QuizKit
//
//  Created by Stephen Radford on 12/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import SwiftyJSON

public struct QKQuiz {

    /// The questions loaded from JSON
    private let questions: [QKQuestion]

    /// Returns a shuffled chunk of questions for use but the `QKSession`
    internal var shuffledQuestions: [QKQuestion] {
        return questions.shuffled()
    }
    
    public init?(loadFromJSONFile path: String) {
        guard let jsonString = try? String(contentsOfFile: path) else {
            return nil
        }
        
        let json = JSON(parseJSON: jsonString)
        questions = json.arrayValue.map { QKQuestion(json: $0.dictionary!) }
    }
    
    public init?(loadFromJSONString jsonString: String) {
        let json = JSON(parseJSON: jsonString)
        questions = json.arrayValue.map { QKQuestion(json: $0.dictionary!) }
    }
    
}
