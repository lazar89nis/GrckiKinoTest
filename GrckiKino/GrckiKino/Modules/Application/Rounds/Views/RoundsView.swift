//
//  RoundsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct RoundsView: View {
    
    @State var viewModel: RoundsViewModel
    
    //let roundsCoordinator: RoundsCoordinator
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                titleView
                listView
            }
            .background(R.color.background.color)
            .navigationTitle("Rounds")
            .toolbar(.hidden, for: .navigationBar)
            navigationLinks
        }
        
    }
    
    var titleView: some View {
        Text("Select round to play".uppercased())
            .font(R.font.neuePlakBold.font(size: 36))
            .foregroundColor(R.color.textWhite.color)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
    }
    
    var listView: some View {
        List(1...20, id: \.self) { index in
            RoundsListRow()
            .onTapGesture {
                viewModel.isGameViewPresented = true
            }
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .background(Color.clear)
    }
    
    
    
    @ViewBuilder var navigationLinks: some View {
        Spacer().frame(width: 0, height: 0)
            .navigationDestination(isPresented: $viewModel.isGameViewPresented) {
                Text("a") 
            }
    }
}

#Preview {
    RoundsView(viewModel: RoundsViewModel())
}
