//
//  Stochastic.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public struct Successor {
    var rule : [String]
    var odds : [Float]
    var probability : [Float]
    var runningTotal : Float
    
    public init(rule: [String],
                odds: [Float]) {
        
        self.rule = rule
        self.odds = odds
        
        calculateProbability()
    }
    
    
    func chooseSuccessor() {
        
        
        
        
        
    }
    
    mutating func calculateProbability() {
        
        for value in odds {
            runningTotal += value
        }
        
        for (index,_) in rule.enumerated() {
            
            probability[index] = (odds[index]/runningTotal)
            
        }
    }
}
