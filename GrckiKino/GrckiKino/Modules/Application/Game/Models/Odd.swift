//
//  Odd.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

struct Odd: Hashable, CustomStringConvertible {
    let value: Double
    let numbersPlayed: Int
    
    init(value: Double, numbersPlayed: Int) {
        self.value = value
        self.numbersPlayed = numbersPlayed
    }
    
    static func == (lhs: Odd, rhs: Odd) -> Bool {
        lhs.value == rhs.value && lhs.numbersPlayed == rhs.numbersPlayed
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(numbersPlayed)
    }
        
    var description: String {
        return "Odd --> value:\(value), numbersPlayed:\(numbersPlayed)"
    }
}
