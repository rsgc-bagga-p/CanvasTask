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
    var counter : Int = 0
    var odds : [Int] = []
    var chosenRule : String = ""
    //var probability : [Float] = []
    
    //create the odds array for each rule
    for rule in input {
        
        let oddsOfRule = rule.components(separatedBy: "/")
        
        if let ruleOdds = Int(oddsOfRule[0]) {
        
        odds.append(ruleOdds)
        
        }
    }
    
    //create the new array
    for i in odds {
        
        for _ in 1...i {
            
            newArray.append(input[counter])
            
        }
        counter += 1
    }
    
    print(newArray)
    
    //choose a random number
    let random = Int(arc4random_uniform(UInt32(newArray.count + 1)))
    
    //print(random)
    
    //chosenRule = newArray[0]
    
    return chosenRule
    
}
