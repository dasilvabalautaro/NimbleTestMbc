//
//  Coordinator.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func goHome() {
        path.removeLast(path.count)
        path.append(Route.login)
    }
    
    func goLogin() {
        path.append(Route.login)
    }
    
    func goReset() {
        path.append(Route.reset)
    }
    
    func goLoad() {
        path.append(Route.load)
    }
    
    func goContentHome() {
        path.removeLast(path.count)
        path.append(Route.home)
    }
    
    func goSurvey() {
        path.append(Route.survey)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goBack(step: Int) {
        path.removeLast(step)
    }
    
    func goFulfilled() {
        path.append(Route.fulfilled)
    }
    
    func goProductivity() {
        path.append(Route.productivity)
    }
    
    func goPlace() {
        path.append(Route.place)
    }
    
    func goQuestion(){
        path.append(Route.question)
    }
    
    
}
