import Foundation

public class EnhancedCanvas : Canvas {
    
    public func render(system s : VisualizedLindenmayerSystem) {
        
        render(system: s, generation: s.n)
        
    }
    
    public func render(system : VisualizedLindenmayerSystem, generation : Int) {
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Change the line length
        system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
        
        // Render the word
        self.saveState()
        //self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        for c in system.word[generation].characters {
            interpret(character: c, forThis: system)
        }
        self.restoreState()

    }
    
    public func renderAnimated(systems : [VisualizedLindenmayerSystem], generations : [Int]) {
        
        var i = 0
        
        var generation: Int = 0
        
        for system in systems {
        
        // Verify that generation that was asked to be rendered actually exists
        if generations.count > i {
            
            generation = generations[i]
            
        } else {
            
            generation = generations[generations.count - 1]
            
        }
        
        if generation > system.n {
            generation = system.n
        }
        
        // Things to do at start of L-system animation...
        if system.animationPosition == 0 {
            
            // Change the line length
            system.currentLength = Float(Double(system.initialLength) / pow(Double(system.reduction), Double(generation)))
            
            // Change the line thickness
            system.currentThickness = Float(Double(system.initialThickness) / pow(Double(system.thicknessReduction), Double(generation)))

            // Move turtle to starting point
            //self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        }
        
        // Don't run past end of the word
        if system.animationPosition < system.word[generation].characters.count {
            
            // Get the index of the next character
            let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)

            // Get the next character
            let c = system.word[generation][index]
            
            // Render the character
            interpret(character: c, forThis: system)

            // Move to next character in word
            system.animationPosition += 1

        }
            i += 1
    }
    
    }
    
    func interpret(character : Character, forThis system : VisualizedLindenmayerSystem) {
        
        let newX: Float = Float(CGFloat(system.x)) + Float(CGFloat(system.currentLength) * CGFloat(cos(system.currentAngle * CGFloat(M_PI)/180)))
        let newY: Float = Float(CGFloat(system.y)) + Float(CGFloat(system.currentLength) * CGFloat(sin(system.currentAngle * CGFloat(M_PI)/180)))
        self.defaultLineWidth = Int(system.currentThickness)
        print(defaultLineWidth)
        
        //print("OLDX: \(system.x)\tNEWX: \(newX)")
        //self.drawLine(fromX: system.x, fromY: system.y, toX: newX, toY: newY)
        //print("OLDY: \(system.y)\tNEWY: \(newY)")
        // Interpret each character of the word
        switch character {
        case "F", "X":
            // Go forward while drawing a line
            self.drawLine(fromX: system.x, fromY: system.y, toX: newX, toY: newY)
            system.x = newX
            system.y = newY
            print("drewline")
        case "f":
            // Go forward without drawing a line
            system.x = newX
            system.y = newY
        case "+":
            //turn left
            system.currentAngle += system.angle
        case "-":
            //turn right
            system.currentAngle -= system.angle
        case "[":
            //saving all of the values before branching
            system.systemStack.append(VisualizedLindenmayerSystem.StateOfSystem(systemX: system.x, systemY: system.y, systemAngle: system.currentAngle))
        case "]":
            //reverting to original state 
            system.x = system.systemStack[system.systemStack.count - 1].systemX
            system.y = system.systemStack[system.systemStack.count - 1].systemY
            system.currentAngle = system.systemStack[system.systemStack.count - 1].systemAngle
            system.systemStack.removeLast()
            
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if let color = system.colors[character] {
                self.lineColor = color
            }
        default:
            // Do nothing for any another character in the word
            break
        }

    }
    
}
