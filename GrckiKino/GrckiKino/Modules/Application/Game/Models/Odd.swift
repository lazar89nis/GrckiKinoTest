//
//  Odd.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

class Odd: Hashable, CustomStringConvertible {
    var value: Double
    var ball: Int
    
    init(value: Double, ball: Int) {
        self.value = value
        self.ball = ball
    }
    
    static func == (lhs: Odd, rhs: Odd) -> Bool {
        lhs.value == rhs.value && lhs.ball == rhs.ball
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(ball)
    }
        
    var description: String {
        return "Odd --> value:\(value), ball:\(ball)"
    }
}
