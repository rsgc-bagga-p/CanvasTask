//
//  StateOfSystem.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-26.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

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
