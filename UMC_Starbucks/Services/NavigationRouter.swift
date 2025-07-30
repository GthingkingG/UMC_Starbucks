//
//  RouterViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/26/25.
//

import SwiftUI
import Observation

@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}
