//
//  InsettableShapes.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct InsettableCircle: InsettableShape {
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let insetRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        return Circle().path(in: insetRect)
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var circle = self
        circle.insetAmount += amount
        return circle
    }
}

struct InsettableRect: InsettableShape {
    var cornerRadius: CGFloat
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let insetRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        return RoundedRectangle(cornerRadius: cornerRadius).path(in: insetRect)
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var rect = self
        rect.insetAmount += amount
        return rect
    }
}
