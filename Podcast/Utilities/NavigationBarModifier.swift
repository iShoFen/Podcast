//
//  NavigationBarModifier.swift
//  Podcast
//
//  Created by etudiant on 19/05/2023.
//

import Foundation
import SwiftUI

// custom navigationBar Background (use it only if you want to update the NavBar with custom trigger and not the std and scrollEdge)
struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        
        let coloredApparence = UINavigationBarAppearance()
        coloredApparence.configureWithTransparentBackground()
        
        coloredApparence.backgroundColor = .clear
        UINavigationBar.appearance().standardAppearance = coloredApparence
        UINavigationBar.appearance().scrollEdgeAppearance = coloredApparence
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}
