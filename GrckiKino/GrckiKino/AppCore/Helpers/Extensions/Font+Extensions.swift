//
//  Font+Extensions.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 21.7.24..
//

import SwiftUI

extension Font {
    static var caption: Font {
        R.font.neuePlakSemiBold.font(size: 12)
    }
    
    static var bodySmall: Font {
        R.font.neuePlakSemiBold.font(size: 13)
    }
    
    static var bodySmallBold: Font {
        R.font.neuePlakBold.font(size: 13)
    }
    
    static var bodyMedium: Font {
        R.font.neuePlakBold.font(size: 14)
    }
    
    static var bodyRegular: Font {
        R.font.neuePlakRegular.font(size: 15)
    }
    
    static var bodyRegularBold: Font {
        R.font.neuePlakBold.font(size: 15)
    }
    
    static var bodyLarge: Font {
        R.font.neuePlakRegular.font(size: 16)
    }
    
    static var bodyLargeBold: Font {
        R.font.neuePlakBold.font(size: 16)
    }
    
    static var appTitle: Font {
        R.font.neuePlakBold.font(size: 36)
    }
}
