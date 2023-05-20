//
//  View.swift
//  Podcast
//
//  Created by etudiant on 19/05/2023.
//

import Foundation
import SwiftUI

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}
