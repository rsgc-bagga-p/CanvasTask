//
//  VisualizedLindenmayerSystem.swift
//  Canvas
//
//  Created by Russell Gordon on 5/3/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class VisualizedLindenmayerSystem : LindenmayerSystem {
    
    public struct StateOfSystem {
        
        var systemX: Float
        var systemY: Float
        var systemAngle: Degrees
        
        public init(systemX: Float, systemY: Float, systemAngle: Degrees) {
            
            self.systemX = systemX
            self.systemY = systemY
            self.systemAngle = systemAngle
        }
        
        
    }
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Float                           // initial horizontal position of turtle
    var y : Float                           // initial vertical position of turtle
    var direction : Int                     // initial direction turtle faces (degrees)
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var colors : [Character : LineColor]
    var systemStack = [StateOfSystem]()
    var currentAngle : Degrees
    var initialThickness : Float
    var currentThickness : Float
    var thicknessReduction : Float
    
    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Float,
                y: Float,
                direction: Int,
                colors: [Character : LineColor] = [:],
                thickness: Float = 1,
                thicknessReduction: Float = 1) {
        
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.colors = colors
        self.currentAngle = Degrees(direction)
        self.initialThickness = thickness
        self.thicknessReduction = thicknessReduction
        self.currentThickness = self.initialThickness
        super.init(with: providedSystem)
    }
}
