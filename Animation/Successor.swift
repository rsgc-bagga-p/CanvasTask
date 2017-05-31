//
//  Stochastic.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation


public func chooseSuccessor(input: [String]) -> String {
    
    var newArray : [String] = [] //holds new array of strings/rules
    var counter : Int = 0 //times to append into newArray
    var odds : [Int] = [] //the odds of each rule
    var chosenRule : String = "" //output of the function
    var cleanArray : [String] = [] //cleans rules for us
    var ruleCharacters : Int = 0 //holds characters in a rule
    var checking : Bool = true //check if something is true or not
    //var probability : [Float] = []
    
    //create the odds array for each rule
    for rule in input { //for the each rule in the array of rules
        
        while checking { //while true
        
        for characters in rule.characters {
            
            if characters != "/" { //if stochastic or deterministic
                
                ruleCharacters +=  1 //rules character counter adds 1
                
                if ruleCharacters == rule.characters.count { //if no character like "/", meaning deterministic
                    
                    return rule //rule
                    
                }
                
            } else  if characters == "/" {
                
                checking = false //break from the loop
                
            }
            
        }
        }
        
        let oddsOfRule = rule.components(separatedBy: "/") //odds of the rule being set in array
        
        cleanArray.append(oddsOfRule[1]) //adding into clean array only rules no odds
        
        if let ruleOdds = Int(oddsOfRule[0]) {
        
        odds.append(ruleOdds) //appending into the odds array
        
        }
    }
    
    //create the new array
    for i in odds { //value in each part of the odds array
        
        for _ in 1...i { //the value of the odds are
            
            newArray.append(cleanArray[counter]) //adds rule into the new array
            
        }
        counter += 1 //incrementing the counter
    }
    
    //print(newArray)
    
    //choose a random number
    let random = Int(arc4random_uniform(UInt32(newArray.count)))
    
    //print(random)
    
    if newArray != [] { // if not a nil value
    
    chosenRule = newArray[random]
    //print(newArray)
        
    }
    
    return chosenRule
    
}
