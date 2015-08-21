//
//  Block.swift
//  SwiftrisPlus
//
//  Created by kevcol on 8/21/15.
//  Copyright (c) 2015 kevcol inc. All rights reserved.
//

import SpriteKit

// #1
let NumberOfColors: UInt32 = 6

// declare enumeration of type Int that implements Printable protocol
enum BlockColor: Int, Printable {
    
    // #3
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // define a computed property, 'spriteName'
    // A computed property is one that behaves like a typical variable,
    // but when accessing it, a code block is invoked to generate its value each time
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // define a computed property, 'description'. Required to adhere to Printable protocol
    var description: String {
        return self.spriteName
    }
    
    // #6
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}

// Block is declared as a class which implements both the Printable and Hashable protocols. 
// Hashable allows Block to be stored in Array2D.
class Block: Hashable, Printable {
    
    // #2
    // Constants
    let color: BlockColor
    
    // #3
    // Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    // #4
    var spriteName: String {
        return color.spriteName
    }
    
    // #5
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    // #6
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// #7
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
