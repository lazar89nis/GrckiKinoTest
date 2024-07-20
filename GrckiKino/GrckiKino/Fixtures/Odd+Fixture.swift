//
//  Odd+Fixture.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

extension Odd {
    static func fixture() -> Odd {
        Odd(value: 0, round: 1)
    }
    
    static func fixtures() -> [Odd] {
        [Odd(value: 0, round: 1),
         Odd(value: 1000, round: 2),
         Odd(value: 100, round: 3),
         Odd(value: 50, round: 4),
         Odd(value: 30, round: 5),
         Odd(value: 25, round: 6),
         Odd(value: 20, round: 7),
         Odd(value: 15, round: 8),
         Odd(value: 13, round: 9),
         Odd(value: 12, round: 10),
         Odd(value: 11, round: 11),
         Odd(value: 10, round: 12),
         Odd(value: 9, round: 13),
         Odd(value: 8, round: 14),
         Odd(value: 7, round: 15),
         Odd(value: 6, round: 16),
         Odd(value: 5, round: 17),
         Odd(value: 4, round: 18),
         Odd(value: 3, round: 19),
         Odd(value: 2, round: 20)]
    }
}
