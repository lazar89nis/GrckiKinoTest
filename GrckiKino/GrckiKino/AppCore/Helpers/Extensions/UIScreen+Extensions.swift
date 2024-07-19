//
//  UIScreen+Extensions.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import UIKit

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
