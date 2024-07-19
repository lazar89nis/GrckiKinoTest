//
//  RSwift+Extensions.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import RswiftResources

extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
}

extension RswiftResources.ColorResource {
    var color: Color {
        Color(name)
    }
}
