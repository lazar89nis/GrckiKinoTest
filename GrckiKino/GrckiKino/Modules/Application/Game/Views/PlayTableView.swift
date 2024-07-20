//
//  PlayTableView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import AlertToast

struct PlayTableView: View {
    let spacing:CGFloat = 6
        
    @State var viewModel: PlayTableViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let buttonSize = calculateButtonSize(availableSpace: geometry.size.width)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(buttonSize),
                                                             spacing: spacing),
                                         count: Config.numberOfGridColumns),
                          spacing: spacing) {
                    ForEach(1...Config.totalNumbers, id: \.self) { number in
                        
                        Button(action: {
                            withAnimation {
                                viewModel.toggleSelection(for: number)
                            }
                        }) {
                            PlayTableCircle(number: number,
                                            selected: viewModel.selectedNumbers.contains(number),
                                            buttonSize: buttonSize)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .toast(isPresenting: $viewModel.showAllSelectedToast){
            AlertToast(displayMode: .banner(.slide),
                       type: .regular,
                       title: "Maximum number of numbers selected",
                       style: AlertToast.AlertStyle.style(titleFont: R.font.neuePlakRegular.font(size: 15)))
        }
    }
    
    func calculateButtonSize(availableSpace: CGFloat) -> CGFloat {
        return (availableSpace - CGFloat(Int(spacing) * (Config.numberOfGridColumns-1))) / CGFloat(Config.numberOfGridColumns)
    }
}

#Preview {
    PlayTableView(viewModel: PlayTableViewModel())
}
