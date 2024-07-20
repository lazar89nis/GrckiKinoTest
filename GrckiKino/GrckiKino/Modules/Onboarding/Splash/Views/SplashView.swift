//
//  SplashView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct SplashView: View {
    
    @State var viewModel: SplashViewModel
    @State private var offset: CGFloat = UIScreen.main.bounds.size.height/2
    
    let roundsCoordinator: RoundsCoordinable
    
    var body: some View {
        rootView
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    viewModel.splashFinished()
                }
            }
    }
    
    var rootView: some View {
        NavigationStack {
            view(forState: viewModel.state)
        }
    }
    
    var launchView: some View {
        ZStack(alignment: .top) {
            backgroundView.edgesIgnoringSafeArea(.all)
            logoView
                .offset(CGSize(width: 0.0, height: offset))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.3)) {
                        offset = 0
                    }
                }
        }
    }
    
    var backgroundView: some View {
        Color.appBackground
    }
    
    var logoView: some View {
        Text("Grcki kino")
            .textCase(.uppercase)
            .foregroundColor(.appTextWhite)
            .font(.title)
            .padding(.top, 6)
    }
    
    @ViewBuilder
    private func view(forState state: AppState) -> some View {
        switch state {
            case .main:
                roundsCoordinator.view
            case .starting:
                launchView
        }
    }
}

#Preview {
    let coordinator = SplashCoordinator(dependency: SplashDependency())
    
    return SplashView(
        viewModel: MockSplashViewModel(state: .starting),
        roundsCoordinator: coordinator.roundsCoordinator
    )
}
