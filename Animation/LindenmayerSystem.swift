import Foundation

public class LindenmayerSystem {
    // Set up required information
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rule : [Character : [Successor]]
    var n : Int                         // number of times the production rule is applied
    var word : [String] = []            // the word that will be rendered
                                        // is rendered with an animation, step by step
    //let successor = Successor(rule: [""], odds: [])
    var runningTotal : Float
    var probability : Float
    var currentRule : String
    //var wordMultiple : [[String]] = []  // 2D array to hold all the multiple system words
    //var ruleMultiple : [Character : String] // dictionary to hold the multiple rules
    public init(angle : Degrees,
                axiom : String,
                rule : [Character : [Successor]],
                generations : Int
                //ruleMultiple : [Character: String] = [:]
                ) {
        
        // Initialize stored properties
        self.angle = angle
        self.axiom = axiom
        self.rule = rule
        self.n = generations
        //self.ruleMultiple = ruleMultiple
        self.word.append(axiom)   // The first word is the axiom
        //self.wordMultiple.append([axiom]
        
//        // Apply the production rule
        //applyRules()
        
    }
    
    
    
    public init(with system : LindenmayerSystem) {
        
        // Initalize stored properties
        self.angle = system.angle
        self.axiom = system.axiom
        self.rule = system.rule
        self.n = system.n
        self.word.append(axiom)   // The first word is the axiom
        //self.ruleMultiple = system.ruleMultiple
        // Apply the production rule
        //applyRules()
    }
    
    
    func applyRules(with system: Successor) {
        
        // See if word needs to be re-written
        if n > 0 {
            
            // Apply the production rule "n" times
            for i in 1...n {
                
                // Create a new word
                var newWord = ""
                
                // Inspect each character of existing word
                for character in word[i - 1].characters {
                    
                    if rule[character] != nil {
                    
                        let random = Float(arc4random_uniform(1))
                        print(random)
                        
                        for j in 1...system.rule.count {
                            
                            if random < system.probability[j] && random >= system.probability[j-1] {
                                
                                currentRule = system.rule[j-1]
                                
                            }
                            
                        }
                        
                        // apply production rule, replace "old" F with new string
                        newWord.append(currentRule)
                        
                    } else {
                        
                        // just copy what's in the existing word to the new word
                        newWord.append(character)
                        
                    }
                    
                }
                
                // Add the re-written word to the system
                word.append(newWord)
            }
            
        }
    }
    
    func chooseRules() {
        
        
        
    }
    
}
