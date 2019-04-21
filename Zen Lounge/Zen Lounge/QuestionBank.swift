//
//  QuestionBank.swift
//  Zen Lounge
//
//  Created by admin on 2019-04-14.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    //Questions for ZenQuiz and correct Answers
    init(){
        
        let item = Question(text:"Stress is the most common reaction of the human organism to various emotional,physical or mental situations",correctAnswer: true)
        
        list.append(item)
        
        list.append(Question(text:"Your body is precious,as it houses your mind and spirit",correctAnswer: true))
        list.append(Question(text:"Inner peace begins with a relaxed body",correctAnswer: true))
        list.append(Question(text:"Simple breathing techniques can help every time you get stressed.",correctAnswer: true))
        list.append(Question(text:"Lack of sleep affects our mood.We feel stressed and mentally exhausted when we do not rest enough",correctAnswer: true))
        list.append(Question(text:"Our energy capacity will recover as soon as we return our routine of sleep",correctAnswer: true))
        list.append(Question(text:"Production of melanin and serotonin occurs during sleep",correctAnswer: true))
        list.append(Question(text:"Music has great power over man in everyday life",correctAnswer: true))
        list.append(Question(text:"Music can relax muscles also affects the work of the heart and the level of stress hormons",correctAnswer: true))
        list.append(Question(text:"Psychological effects that music has on man are undeniable",correctAnswer: true))
        
        
        
        
    }
}
