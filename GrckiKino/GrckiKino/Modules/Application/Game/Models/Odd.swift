//
//  Odd.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

class Odd: Hashable, CustomStringConvertible {
    var value: Int
    var round: Int
    
    init(value: Int, round: Int) {
        self.value = value
        self.round = round
    }
    
    static func == (lhs: Odd, rhs: Odd) -> Bool {
        lhs.value == rhs.value && lhs.round == rhs.round
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(round)
    }
        
    var description: String {
        return "Odd --> value:\(value), round:\(round)"
    }
}
