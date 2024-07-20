//
//  PlayTableCircle.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct PlayTableCircle: View {
    var number: Int
    var selected: Bool = false
    var buttonSize: CGFloat = 50.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(selected ?
                      AnyShapeStyle(Config.circleGradients[Utility.getGradientIndex(number: number)]) :
                        AnyShapeStyle(R.color.circleBackground.color))
                .frame(width: buttonSize, height: buttonSize)
            
            InsettableCircle(insetAmount:4/2)
                .stroke(Color.white.opacity( selected ? 0.5 : 0.08),
                        lineWidth: buttonSize*0.1)
                .frame(width: buttonSize, height: buttonSize)
            
            Text("\(number)")
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                .font(R.font.neuePlakBold.font(size: buttonSize/2.5))
                .foregroundColor(R.color.textWhite.color)
        }
    }
}

#Preview {
    VStack {
        ForEach(0...Config.circleGradients.count-1, id: \.self) { number in
            HStack {
                PlayTableCircle(number: (number*Config.numberOfGridColumns)+1)
                PlayTableCircle(number: (number*Config.numberOfGridColumns)+1, selected: true)
            }
        }
    }
}
