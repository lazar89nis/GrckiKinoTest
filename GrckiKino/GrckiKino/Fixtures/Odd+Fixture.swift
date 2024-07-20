//
//  Odd+Fixture.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

extension Odd {
    static func fixture() -> Odd {
        Odd(value: 37.5, ball: 1)
    }
    
    static func fixtures() -> [Odd] {
        [Odd(value: 3.75, ball: 1),
         Odd(value: 14, ball: 2),
         Odd(value: 65, ball: 3),
         Odd(value: 275, ball: 4),
         Odd(value: 1350, ball: 5),
         Odd(value: 6500, ball: 6),
         Odd(value: 25000, ball: 7),
         Odd(value: 125000, ball: 8)]
    }
}
