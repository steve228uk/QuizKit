//
//  QKSession.swift
//  QuizKit
//
//  Created by Stephen Radford on 12/03/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

public class QKSession {
    
    private init() { }
    
    /// The shared instance of the session
    public static let `default` = QKSession()
    
    /// The delegate for the session
    public weak var delegate: QKSessionDelegate?
    
    /// The quiz that the session is currently using
    private var quiz: QKQuiz?
    
    /// The chunk of questions being used in the session
    private var questionChunk = [QKQuestion]()
    
    /// The responses given by the user
    public private(set) var responses = [QKQuestion:Bool]()
    
    /// Limits the number of questions in the session
    public var limit: Int = 0
    
    /// The number of questions the user got correct
    public var score: Int {
        return responses.filter { $1 }.count
    }

    /// The score the user achieved on the quiz
    public var formattedScore: String {
        let score = responses.filter { $1 }.count
        return "\(score) / \(responses.count)"
    }
    
    /// Loads a new quiz into the session
    ///
    /// - Parameter quiz: The quiz to load
    public func load(quiz: QKQuiz) {
        self.quiz = quiz
    }
    
    /// Starts the quiz and resets all responses from the previous quiz
    ///
    /// - Throws: Error if a quiz has not been loaded into the session
    public func start() throws {
        guard let quiz = quiz else {
            throw QKError.quizNotSetOnSession
        }
        
        let shuffled = quiz.shuffledQuestions
        questionChunk = ((limit > 0) && (shuffled.count > limit)) ? Array(shuffled[0..<limit]) : shuffled
        responses = [QKQuestion:Bool]()
        
        delegate?.quizDidStart()
    }
    
    
    /// Load the next question in the quiz session
    ///
    /// - Parameter question: The current question
    /// - Returns: The next question or nil if it's the last question in the list.
    public func nextQuestion(after question: QKQuestion? = nil) -> QKQuestion? {
        guard let question = question, let index = questionChunk.index(of: question) else {
            return questionChunk[0]
        }
        
        if questionChunk.last == question {
            delegate?.quizDidEnd()
            return nil
        }
        
        return questionChunk[index + 1]
    }
    
    /// Submit a response to a question
    ///
    /// - Parameters:
    ///   - response: The response to submit
    ///   - question: The question the response relates to
    @discardableResult public func submit(response: String, for question: QKQuestion) -> Bool {
        let isCorrect = question.correctResponse == response
        responses[question] = isCorrect
        return isCorrect
    }
    
    /// Returns the progress value for the current question. This is great for use in a `UIProgressView`
    ///
    /// - Parameter question: The question to detect the progress for
    /// - Returns: The progress as a Float
    public func progress(for question: QKQuestion) -> Float {
        guard let index = questionChunk.index(of: question) else {
            return 0
        }
        
        let current = Float(Int(index) + 1)
        return current / Float(questionChunk.count)
    }
    
    /// Returns the progress value for the current question. This is great for use in a `UIProgressView`
    ///
    /// - Parameter index: The index of the current question
    /// - Returns: The progress as a float
    public func progress(for index: Int) -> Float {
        let current = Float(Int(index) + 1)
        return current / Float(questionChunk.count)
    }
    
}
