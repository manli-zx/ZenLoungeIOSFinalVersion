 //
//  Question.swift
//  Zen Lounge
//
//  Created by admin on 2019-04-14.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
 
 class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
 }
