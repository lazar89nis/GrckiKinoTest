//
//  Config.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation
import SwiftUI

class Config {
    static let baseUrl = "https://api.opap.gr/draws/v3.0"
    static let drawAnimationUrl = "https://www.mozzartbet.com/sr/lotto-animation/26#/"
    static let gameId = 1100
    static let numberOfGridColumns = 8
    static let numberOfBalls = 80
    static let maxNumbersToPlay = 15
    
    static let circleGradients: [LinearGradient] = [
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.pink, Color.red]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.teal, Color.cyan]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.blue]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.brown, Color.gray]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.mint, Color.green]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.green, Color.red]), startPoint: .top, endPoint: .bottom)
    ]
}
