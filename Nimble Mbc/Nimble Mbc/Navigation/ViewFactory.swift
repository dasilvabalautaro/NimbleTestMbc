//
//  ViewFactory.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import Foundation
import SwiftUI

class ViewFactory {
    
    @ViewBuilder
    static func viewForDestination(_ destination: Route) -> some View {
        switch destination {
            case .login:
                LoginView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .reset:
                ResetView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .load:
                LazyLoadView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .home:
                ContentHomeView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .survey:
                SurveyView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .fulfilled:
                StepsView(options: Survey.fulfilled.rawValue)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .productivity:
                StepsView(options: Survey.productivity.rawValue)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .place:
                StepsView(options: Survey.place.rawValue)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            case .question:
                StepsView(options: Survey.question.rawValue)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
        }
    
    }
}
