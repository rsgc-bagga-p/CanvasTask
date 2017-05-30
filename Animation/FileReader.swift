//
//  ReadFile.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-28.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class FileReader {
    
//    struct systemData {
//        
//        var xVal: Float = 0.0
//        var yVal: Float = 0.0
//        var axiom: String = ""
//        var rules: [Character : [String]] = [:]
//        var generations: Int = 0
//        var direction: Float = 0
//        var length: Float = 0
//        var lengthReduction: Float = 0
//        var thickness: Float = 0
//        var thicknessReduction: Float = 0
//        var angle: Degrees = 0
//        var colours: [Character : LineColor] = [:]
//        
//    }
    
    let path : String
    
    init(path: String) {
        
        self.path = path
        
    }
    
    
    func analyzeFile() -> [VisualizedLindenmayerSystem] {
        
        guard let reader = LineReader(path: path) else {
            
            print("cannot open file")
            exit(0)
            
        }
        
        var lsystems : [VisualizedLindenmayerSystem] = [] //an array for the systems created
        var components : [String] = [] //an array for the components of the file
        
        
        //interpret each line of the file
        for (_, line) in reader.enumerated() {
            
            let lineData = line.components(separatedBy: " ")
            let cleanedLineData = lineData[0].components(separatedBy: "\n")
            
            if cleanedLineData[0] == "]"{
                
                lsystems.append(createLSystems(value: components))
                components = []
                
            }
            
            components.append(line)
            
        }
        
        return lsystems
    }
    
    
    func createLSystems(value: [String]) -> VisualizedLindenmayerSystem {
        
        var xVal: Float = 0.0
        var yVal: Float = 0.0
        var axiom: String = ""
        var rules: [Character : [String]] = [:]
        var generations: Int = 0
        var direction: Int = 0
        var length: Float = 0
        var lengthReduction: Float = 1
        var thickness: Float = 1
        var thicknessReduction: Float = 0
        var angle: Degrees = 0
        var colours: [Character : LineColor] = [:]
        
        for (lineNumber, line) in value.enumerated() {
            
            //need to clean up the value so there are no issues
            var data = line.components(separatedBy: "\n")
            var dataType = data[0].components(separatedBy: ":")
            print(dataType[0])
            
            switch dataType[0] {
                
            case "angle" :
                angle = Degrees(Int(dataType[1])!)
                break
            case "axiom" :
                axiom = dataType[1]
                break
            case "rules" :
                var adder: Int = 2
                while value[lineNumber + adder] != "}" {
                    
                    var newRule = value[lineNumber + 2].components(separatedBy: "\n")
                    var currentRule = newRule[0].components(separatedBy: "=")
                    let currentIndex = Character(currentRule[0])
                    
                    rules[currentIndex]?.append(currentRule[1])
                    
                    adder += 1
                }
                break
            case "generations" :
                generations = Int(dataType[1])!
                break
            case "colors" :
                var lineChange: Int = 2
                while value[lineNumber + lineChange] != "}" {
                    
                    var newColourRule = value[lineNumber + 2].components(separatedBy: "\n")
                    var currentColourRule = newColourRule[0].components(separatedBy: "=")
                    let currentColourIndex = currentColourRule[0]
                    var specificColours = currentColourRule[1].components(separatedBy: ",")
                    
                    let hue = Float(specificColours[0])!
                    let saturation = Float(specificColours[1])!
                    let brightness = Float(specificColours[2])!
                    
                    colours[Character(currentColourIndex)] = LineColor(hue: hue, saturation: saturation, brightness: brightness)
                    
                    lineChange += 1
                }
                break
            case "direction" :
                direction = Int(dataType[1])!
                break
            case "length" :
                length = Float(dataType[1])!
                break
            case "length_reduction" :
                lengthReduction = Float(dataType[1])!
                break
            case "thickness" :
                thickness = Float(dataType[1])!
                break
            case "thickness_reduction" :
                thicknessReduction = Float(dataType[1])!
                break
            case "x" :
                xVal = Float(dataType[1])!
                break
            case "y" :
                yVal = Float(dataType[1])!
                break
            default :
                break
            }
            
        }
        
        let system : LindenmayerSystem = LindenmayerSystem(angle: angle, axiom: axiom, rule: rules, generations: generations)
        let visualizsedSystem : VisualizedLindenmayerSystem = VisualizedLindenmayerSystem(with: system, length: length, reduction: lengthReduction, x: xVal, y: yVal, direction: direction, colors: colours, thickness: thickness, thicknessReduction: thicknessReduction)
        return visualizsedSystem
    }
    
}
