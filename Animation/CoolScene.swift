//
//  CoolScene.swift
//  Canvas
//
//  Created by Puneet Singh Bagga on 2017-05-30.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class CoolScene : NSObject {
    
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        
        
    }
    
    
    
    
}
