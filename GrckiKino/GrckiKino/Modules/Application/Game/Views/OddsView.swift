//
//  OddsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

struct OddsView: View {
    
    var odds:[Odd]
    @Binding var selectedNumbers: Set<Int>
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(odds, id: \.self) { odd in
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(height: 60)
                                .foregroundColor(R.color.oddsBubbleBg.color)
                                .cornerRadius(8)
                                .overlay(
                                    InsettableRect(cornerRadius: 6, insetAmount: 1)
                                        .stroke(selectedNumbers.count == odd.ball ? R.color.oddsStrokeActive.color : R.color.oddsStroke.color, lineWidth: 2)
                                )
                            
                            Text(format(odd.value))
                                .font(R.font.neuePlakBold.font(size: 14))
                                .foregroundColor(R.color.textWhite.color)
                                .padding(.horizontal, 8)
                                .offset(CGSize(width: 0.0, height: -12.0))
                            
                            Text("\(odd.ball)")
                                .font(R.font.neuePlakSemiBold.font(size: 12))
                                .foregroundColor(R.color.textWhite.color)
                                .padding(.horizontal, 10)
                                .padding(.top, 3)
                                .padding(.bottom, 2)
                                .background(.white.opacity(0.1))
                                .cornerRadius(4)
                                .padding(.horizontal, 8)
                                .offset(CGSize(width: 0.0, height: 13.0))
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .onChange(of: selectedNumbers) { newValue, _ in
                if newValue.count > 0 && newValue.count < odds.count {
                    withAnimation {
                        proxy.scrollTo(odds[newValue.count-1], anchor: .center)
                    }
                }
            }
        }
    }
    
    func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

#Preview {
    OddsView(odds: Odd.fixtures(), selectedNumbers: .constant([3]))
    .background(R.color.background.color)
}
