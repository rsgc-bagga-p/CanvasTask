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
        
        var author: String = ""
        var description: String = ""
        var xVal: Float = 0.0
        var yVal: Float = 0.0
        var axiom: String = ""
        var rules: [Character : [String]] = [:]
        var generations: Int = 0
        var direction: Float = 0
        var length: Float = 0
        var reduction: Float = 0
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
            
        
            var data = line.components(separatedBy: ":")
            
            
            
        }
        
        return lsystems
    }
    
}
