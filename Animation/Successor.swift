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
    //var probability : [Float] = []
    
    //create the odds for each rule
    for rule in input {
        
        let probabilityRule = rule.components(separatedBy: "/")
        
        odds.append(Int(probabilityRule[0])!)
        
        
    }

    
    //create the new array of rules, each with different amounts of the same rule
    for i in 1...odds.count {
        
        for j in 0...odds[i] {
            
            newArray.append(input[i])
            
        }
        
    }
    
    //choose a random number and return a string
    let random = Int(arc4random_uniform(UInt32(newArray.count)))
    
    //set the new rule the random chosen
    chosenRule = newArray[random]
    
    //return the new rule
    return chosenRule

}
