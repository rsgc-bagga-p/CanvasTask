//
//  ReadFile.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-28.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class FileReader {
    
    struct systemData {
        
        var xVal: Float = 0.0
        var yVal: Float = 0.0
        var axiom: String = ""
        var rules: [Character : [String]] = [:]
        var generations: Int = 0
        var direction: Float = 0
        var length: Float = 0
        var lengthReduction: Float = 0
        var thickness: Float = 0
        var thicknessReduction: Float = 0
        var angle: Degrees = 0
        var colours: [String : Color] = [:]
        
    }
    
    let path : String
    
    init(path: String) {
        
        self.path = path
        
    }
    
    var lsystems : [VisualizedLindenmayerSystem] = []
    
    func readFile() -> [VisualizedLindenmayerSystem] {
        
        guard let reader = LineReader(path: path) else {
            
            print("cannot open file")
            exit(0)
            
        }
        
        
        var components : [String] = [] //an array for the components of the file
        
        
        //interpret each line of the file
        for (_, line) in reader.enumerated() {
            
            components.append(contentsOf: line.components(separatedBy: "\r"))
            
            
        }
        
        return createLSystems(value: components)
    }
    
    
    func createLSystems(value: [String]) -> [VisualizedLindenmayerSystem] {
        
        var system : systemData
        
        for (lineNumber, line) in value.enumerated() {
            
            //need to clean up the value so there are no issues
            var data = line.components(separatedBy: "\n")
            var dataType = data[0].components(separatedBy: ":")
            
            
            switch dataType[0] {
                
            case "angle" :
                system.angle = Degrees(Int(dataType[1])!)
                break
            case "axiom" :
                system.axiom = dataType[1]
                break
            case "rules" :
                system.rules
                break
            case "generations" :
                system.generations = Int(dataType[1])!
                break
            case "colors" :
                system.colours
                break
            case "direction" :
                system.direction = Float(dataType[1])!
                break
            case "length" :
                system.length = Float(dataType[1])!
                break
            case "length_reduction" :
                system.lengthReduction = Float(dataType[1])!
                break
            case "thickness" :
                system.thickness = Float(dataType[1])!
                break
            case "thickness_reduction" :
                system.thicknessReduction = Float(dataType[1])!
                break
            case "x" :
                system.xVal = Float(x)!
                break
            case "y" :
                system.yVal = Float(y)!
                break
            }
            
        }
        
        return lsystems
    }
    
}
