//
//  Stochastic.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation


public func chooseSuccessor(input: [String]) -> String {
    
    var newArray : [String] = []
    var counter : Int = 0
    var odds : [Int] = []
    var chosenRule : String = ""
    var cleanArray : [String] = []
    var ruleCharacters : Int = 0
    var checking : Bool = true
    //var probability : [Float] = []
    
    //create the odds array for each rule
    for rule in input {
        
        while checking {
        
        for characters in rule.characters {
            
            if characters != "/" {
                
                ruleCharacters +=  1
                
                if ruleCharacters == rule.characters.count {
                    
                    return rule
                    
                }
                
            } else  if characters == "/" {
                
                checking = false
                
            }
            
        }
        }
        
        let oddsOfRule = rule.components(separatedBy: "/")
        
        cleanArray.append(oddsOfRule[1])
        
        if let ruleOdds = Int(oddsOfRule[0]) {
        
        odds.append(ruleOdds)
        
        }
    }
    
    //create the new array
    for i in odds {
        
        for _ in 1...i {
            
            newArray.append(cleanArray[counter])
            
        }
        counter += 1
    }
    
    //print(newArray)
    
    //choose a random number
    let random = Int(arc4random_uniform(UInt32(newArray.count)))
    
    //print(random)
    
    if newArray != [] {
    
    chosenRule = newArray[random]
    //print(newArray)
        
    }
    
    return chosenRule
    
}
