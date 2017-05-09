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
    
    // Create the basic L-systems
    let kochSnowflake : LindenmayerSystem
    let kochIsland : LindenmayerSystem
    let kochSwirl : LindenmayerSystem
    let kochConstruction : LindenmayerSystem
    
    //create multiple rule L-system thang
    let multipleRuleSystem : LindenmayerSystem
    let smallMultipleRuleSystem : VisualizedLindenmayerSystem
    
    // Create the visualizations of the snowflake
    let smallKochSnowflake : VisualizedLindenmayerSystem
    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
    let mediumKochSwirl : VisualizedLindenmayerSystem
    let mediumConstruction : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "1F++2F++3F",
                                          rule: [
                                            
                                                "F" : "1F-2F++1F-2F"
                                            
                                                ],
                                          generations: 5)
        
        // Set up a random thang for testing
        multipleRuleSystem = LindenmayerSystem(angle: 60,
                                               axiom: "1FX++2FX++3FX",
                                               rule: [
                                                "X" : "2F++3X",
                                                "F" : "3FX++1FX"
                                                     ],
                                               generations: 3)
        
        smallMultipleRuleSystem = VisualizedLindenmayerSystem(with: multipleRuleSystem,
                                                              length: 270,
                                                              reduction: 3,
                                                              x: 120,
                                                              y: 175,
                                                              direction: 0,
                                                              colors: [
                                                                "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
                                                                "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
                                                                "3" : LineColor(hue: 240, saturation: 80, brightness: 90)
                                                                      ]
                                                               )
        
        
        // Visualize this as a small snowflake
        smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                         length: 90,
                                                         reduction: 3,
                                                         x: 120,
                                                         y: 175,
                                                         direction: 0,
                                                         colors: [
                                                                    "1" : LineColor(hue: 0, saturation: 80, brightness: 90),
                                                                    "2" : LineColor(hue: 120, saturation: 80, brightness: 90),
                                                                    "3" : LineColor(hue: 240, saturation: 80, brightness: 90)
                                                            
                                                                ]
                                                        )
        
        // Visualize this as a small snowflake
        mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                          length: 270,
                                                          reduction: 3,
                                                          x: 250,
                                                          y: 300,
                                                          direction: 0)
        
        
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 90,
                                       axiom: "F-F-F-F",
                                       rule: ["F" : "F-F+F+FF-F-F+F"],
                                       generations: 5)
        
        // Visualize the Koch Island
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland,
                                                       length: 300,
                                                       reduction: 4,
                                                       x: 100,
                                                       y: 400,
                                                       direction: 10)
        
        // Set up a Koch Swirl
        kochSwirl = LindenmayerSystem(angle: 90,
                                      axiom: "-F",
                                      rule: ["F" : "F+F-F-F+F"],
                                      generations: 4)
        
        // Visualize the Koch Swirl
        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
                                                      length: 300,
                                                      reduction: 3,
                                                      x: 250,
                                                      y: 400,
                                                      direction: 0)

        // Set up another Koch construction
        kochConstruction = LindenmayerSystem(angle: 90,
                                             axiom: "F-F-F-F",
                                             rule: ["F" : "FF-F-F-F-F-F+F"],
                                             generations: 3)
        
        // Visualize this other Koch construction
        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
                                                         length: 200,
                                                         reduction: 4,
                                                         x: 250,
                                                         y: 350,
                                                         direction: 0)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 30
        
        print(smallMultipleRuleSystem.word[2])
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimated(system: smallMultipleRuleSystem, generation: 2)
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
