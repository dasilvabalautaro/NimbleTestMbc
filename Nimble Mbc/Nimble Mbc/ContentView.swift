//
//  ContentView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @State var showSplashView: Bool = true
    @ObservedObject var navigationCoordinator = Coordinator()
    @ObservedObject var viewModel: SplashViewModel = Resolver.resolve()

    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            VStack {
                if showSplashView {
                    SplashView().onAppear{
                        viewModel.onAppear()
                    }
                }
            }
            .onChange(of: self.viewModel.finishProcess){_ in
                withAnimation {
                    self.showSplashView = false
                }
                switch self.viewModel.statusUser {
                case .unauthenticated:
                    self.navigationCoordinator.goLogin()
                case .authenticated:
                    self.navigationCoordinator.goLoad()
                }
                
            }
            .navigationDestination(for: Route.self) { path in
                ViewFactory.viewForDestination(path)
            }
        }
        .environmentObject(navigationCoordinator)
    }
}

#Preview {
    ContentView()
}
