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
                                .foregroundColor(.appOddsBubbleBg)
                                .cornerRadius(8)
                                .overlay(
                                    InsettableRect(cornerRadius: 6, insetAmount: 1)
                                        .stroke(selectedNumbers.count == odd.numbersPlayed ? Color.appOddsStrokeActive : Color.appOddsStroke, lineWidth: 2)
                                        .animation(.easeInOut(duration: 0.3), value: selectedNumbers)
                                )
                            
                            Text(format(odd.value))
                                .font(.bodyMedium)
                                .foregroundColor(.appTextWhite)
                                .padding(.horizontal, 8)
                                .offset(CGSize(width: 0.0, height: -12.0))
                            
                            Text("\(odd.numbersPlayed)")
                                .font(.caption)
                                .foregroundColor(.appTextWhite)
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
            .scrollIndicators(.hidden)
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
    .background(Color.appBackground)
}
