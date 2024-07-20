//
//  Odd+Fixture.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

extension Odd {
    static func fixture() -> Odd {
        Odd(value: 37.5, numbersPlayed: 1)
    }
    
    static func fixtures() -> [Odd] {
        [Odd(value: 3.75, numbersPlayed: 1),
         Odd(value: 14, numbersPlayed: 2),
         Odd(value: 65, numbersPlayed: 3),
         Odd(value: 275, numbersPlayed: 4),
         Odd(value: 1350, numbersPlayed: 5),
         Odd(value: 6500, numbersPlayed: 6),
         Odd(value: 25000, numbersPlayed: 7),
         Odd(value: 125000, numbersPlayed: 8)]
    }
}
