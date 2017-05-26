//
//  Stochastic.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

//public class Successor {
//    var rule : [String]
//    var odds : [Float]
//    var probability : [Float]
//    var runningTotal : Float
//    
//    public init(rule: [String],
//                odds: [Float],
//                probability: [Float] = [],
//                runningTotal: Float = 0.0) {
//        
//        self.rule = rule
//        self.odds = odds
//        self.probability = probability
//        self.runningTotal = runningTotal
//        chooseSuccessor()
//    }
//    
//    
//    func chooseSuccessor() -> String {
//        var successor: String = ""
//        
//        //calculate probability
//        for value in odds {
//            runningTotal += value
//        }
//        
//        for (index,_) in rule.enumerated() {
//            
//            probability.append((odds[index]/runningTotal))
//            
//        }
//        
//        let randomVal = Float(arc4random_uniform(100))
//        let probabilityVal = randomVal/1000
//        
//        for j in 1...rule.count {
//            
//            if probabilityVal < probability[j] && probabilityVal >= probability[j-1] {
//                
//                successor = rule[j-1]
//                
//            }
//            
//        }
//       
//        return successor
//        
//    }
//    
//    }


public func chooseSuccessor(input: [String]) -> String {
    
    var newArray : [String] = []
    var chosenRule : String = ""
    var odds : [Int] = []
    var runningTotal : Int = 0
    var probability : [Float] = []
    
    //create the odds array for each rule
    for rule in input {
        
        newArray.append(rule)
        
        let probabilityRule = rule.components(separatedBy: "/")
        
        if let ruleProbability = Int(probabilityRule[0]) {
        
        odds.append(ruleProbability)
        
        }
    }

    
    
    
//    //create a running total to calculate the probability
//    for i in 1...newArray.count {
//        
//        runningTotal += odds[i-1]
//        
//    }
//    
//    //create the probabilities for each rule
//    for j in 1...odds.count {
//        
//        probability.append(Float(odds[j-1]/runningTotal))
//        
//    }
//
//    //choose a random number
//    let random = Float(Int(arc4random_uniform(100))/1000)
//    
//    //finally compare the values and then choose the rule
//    for k in 1...probability.count {
//        
//        if random <= probability[k-1] {
//            
//            chosenRule = newArray[k-1]
//            
//        } else if random >= probability[k-1] && random <= probability[k] {
//            
//            chosenRule = newArray[k]
//            
//        }
//        
//    }
//    
    //return the new rule
    return chosenRule
}
