//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    let file : FileReader
    let visualizedLSystems: [VisualizedLindenmayerSystem]
   // var deterministicPicture: [VisualizedLindenmayerSystem]
    //var naturalPicture: [VisualizedLindenmayerSystem]
    
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        file = FileReader(path: "/Users/student/Documents/GitHub/CanvasTask/Animation/l-systems.txt")
        
        visualizedLSystems = file.analyzeFile()
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 300
        
        let gradient = Gradient(on: canvas)
        let ground = Gradient(on: canvas)
        
//        //deterministicPicture
//        deterministicPicture.append(visualizedLSystems[0])
//        deterministicPicture.append(visualizedLSystems[1])
//        deterministicPicture.append(visualizedLSystems[2])
//        deterministicPicture.append(visualizedLSystems[10])
        
//        //naturalPicture
//        naturalPicture.append(visualizedLSystems[10])
//        naturalPicture.append(visualizedLSystems[9])
//        naturalPicture.append(visualizedLSystems[6])
//        naturalPicture.append(visualizedLSystems[5])
        
        
        ground.makeGradient(lowerLeftX: 0, lowerLeftY: 0, from: 10, to: 22, brightness: 70)
        gradient.makeGradient(lowerLeftX: 0, lowerLeftY: 100, from: 220, to: 268, brightness: 60)
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        
        
        // Render the current system
        canvas.render(systems: [visualizedLSystems[10],visualizedLSystems[9],visualizedLSystems[6],visualizedLSystems[5]], generations: [5,2,1,1])
        
    }
    
//    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
//    //       Therefore, the line immediately below must always be present.
//    let canvas : EnhancedCanvas
//    
//    // Create the basic L-systems
//    let kochSnowflake : LindenmayerSystem
//    let kochIsland : LindenmayerSystem
//    let kochSwirl : LindenmayerSystem
//    let kochConstruction : LindenmayerSystem
//    
//    //create multiple rule L-system thang
//    let multipleRuleSystem : LindenmayerSystem
//    let smallMultipleRuleSystem : VisualizedLindenmayerSystem
//    
//    // Create the visualizations of the snowflake
//    let smallKochSnowflake : VisualizedLindenmayerSystem
//    let mediumKochSnowflake : VisualizedLindenmayerSystem
//    
//    // Create visualizations of other systems
//    let largeKochIsland : VisualizedLindenmayerSystem
//    let mediumKochSwirl : VisualizedLindenmayerSystem
//    let mediumConstruction : VisualizedLindenmayerSystem
//    
//    //create branching system for testing
//    let branchingSystem : LindenmayerSystem
//    let smallBranchingSystem : VisualizedLindenmayerSystem
//    
//    //create branching system for testing
//    let branchingSystem2 : LindenmayerSystem
//    let smallBranchingSystem2 : VisualizedLindenmayerSystem
//    
//    // This runs once, equivalent to setup() in Processing
//    override init() {
//        
//        // Create a new canvas
//        canvas = EnhancedCanvas(width: 500, height: 500)
//        
//        // Set up a Koch snowflake
//        kochSnowflake = LindenmayerSystem(angle: 60,
//                                          axiom: "1F++2F++3F",
//                                          rule: [
//                                            
//                                                "F" : ["1F-2F++1F-2F"]
//                                            
//                                                ],
//                                          generations: 10)
//        
//        //branching system for testing
//        branchingSystem = LindenmayerSystem(angle: 22, axiom: "FX", rule: ["F" : ["1/FF-[-F+F]+[+F-F]"], "X" : ["1/FF+[+F]+[-F]"]], generations: 5)
//        
//        smallBranchingSystem = VisualizedLindenmayerSystem(with: branchingSystem, length: 10, reduction: 1, x: 250, y: 50, direction: 90, colors: [
//            "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
//            "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
//            "3" : LineColor(hue: 240, saturation: 80, brightness: 90),
//            "4" : LineColor(hue: 288, saturation: 80, brightness: 36),
//            "5" : LineColor(hue: 174, saturation: 71, brightness: 88),
//            "6" : LineColor(hue: 50, saturation: 96, brightness: 100)
//            ], thickness: 10, thicknessReduction: 1.2)
//        
//        //branching system for testing
//        branchingSystem2 = LindenmayerSystem(angle: 22, axiom: "F", rule: ["F" : ["1/FF-[-F+F+F]+[+F-F-F]"]], generations: 5)
//        
//        smallBranchingSystem2 = VisualizedLindenmayerSystem(with: branchingSystem2, length: 10, reduction: 1, x: 50, y: 50, direction: 90, colors: [
//            "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
//            "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
//            "3" : LineColor(hue: 240, saturation: 80, brightness: 90),
//            "4" : LineColor(hue: 288, saturation: 80, brightness: 36),
//            "5" : LineColor(hue: 174, saturation: 71, brightness: 88),
//            "6" : LineColor(hue: 50, saturation: 96, brightness: 100)
//            ], thickness: 10, thicknessReduction: 1.2)
//        
//        // Set up a random thang for testing
//        multipleRuleSystem = LindenmayerSystem(angle: 60,
//                                               axiom: "X",
//                                               rule: [
//                                                "X" : ["1/1F-2X-3F","2/4F-5X-6F" ],
//                                                "F" : ["1/3X+2F+1X","3/2X+3F+1X"]
//                                                     ],
//                                               generations: 5)
//        
//        smallMultipleRuleSystem = VisualizedLindenmayerSystem(with: multipleRuleSystem,
//                                                              length: 5,
//                                                              reduction: 1,
//                                                              x: 0,
//                                                              y: 480,
//                                                              direction: 0,
//                                                              colors: [
//                                                                "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
//                                                                "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
//                                                                "3" : LineColor(hue: 240, saturation: 80, brightness: 90),
//                                                                "4" : LineColor(hue: 288, saturation: 80, brightness: 36),
//                                                                "5" : LineColor(hue: 174, saturation: 71, brightness: 88),
//                                                                "6" : LineColor(hue: 50, saturation: 96, brightness: 100)
//                                                                      ]
//                                                               )
//        
//        
//        // Visualize this as a small snowflake
//        smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
//                                                         length: 90,
//                                                         reduction: 3,
//                                                         x: 120,
//                                                         y: 175,
//                                                         direction: 0,
//                                                         colors: [
//                                                                    "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
//                                                                    "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
//                                                                    "3" : LineColor(hue: 240, saturation: 80, brightness: 90)
//                                                            
//                                                                ]
//                                                        )
//        
//        // Visualize this as a small snowflake
//        mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
//                                                          length: 270,
//                                                          reduction: 3,
//                                                          x: 250,
//                                                          y: 300,
//                                                          direction: 0)
//        
//        
//        // Set up a Koch Island
//        kochIsland = LindenmayerSystem(angle: 90,
//                                       axiom: "F-F-F-F",
//                                       rule: ["F" : ["F-F+F+FF-F-F+F"]],
//                                       generations: 5)
//        
//        // Visualize the Koch Island
//        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland,
//                                                       length: 300,
//                                                       reduction: 4,
//                                                       x: 100,
//                                                       y: 400,
//                                                       direction: 10)
//        
//        // Set up a Koch Swirl
//        kochSwirl = LindenmayerSystem(angle: 90,
//                                      axiom: "-F",
//                                      rule: ["F" : ["F+F-F-F+F"]],
//                                      generations: 4)
//        
//        // Visualize the Koch Swirl
//        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
//                                                      length: 300,
//                                                      reduction: 3,
//                                                      x: 250,
//                                                      y: 400,
//                                                      direction: 0)
//
//        // Set up another Koch construction
//        kochConstruction = LindenmayerSystem(angle: 90,
//                                             axiom: "F-F-F-F",
//                                             rule: ["F" : ["FF-F-F-F-F-F+F"]],
//                                             generations: 3)
//        
//        // Visualize this other Koch construction
//        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
//                                                         length: 200,
//                                                         reduction: 4,
//                                                         x: 250,
//                                                         y: 350,
//                                                         direction: 0)
//        
//        // The frame rate can be adjusted; the default is 60 fps
//        canvas.framesPerSecond = 40
//        
//        print(smallMultipleRuleSystem.word[2])
//        
//    }
//    
//    // Runs repeatedly, equivalent to draw() in Processing
//    func draw() {
//        
//        // Render the current system
//        canvas.renderAnimated(systems: [smallMultipleRuleSystem, smallKochSnowflake, smallBranchingSystem,smallBranchingSystem2], generations: [5,3,5,5])
//        
//    }
//    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
