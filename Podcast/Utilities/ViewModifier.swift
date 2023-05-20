//
//  GetHeightModifier.swift
//  Podcast
//
//  Created by etudiant on 19/05/2023.
//

import Foundation
import SwiftUI

// from https://onmyway133.com/posts/how-to-get-view-height-in-swiftui/
struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    height = geometry.size.height
                }
                
                return Color.clear
            }
        )
    }
}

struct GetWidthModifier: ViewModifier {
    @Binding var width: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    width = geometry.size.width
                }
                
                return Color.clear
            }
        )
    }
}


struct GetHWModifier: ViewModifier {
    @Binding var height: CGFloat
    @Binding var width: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    height = geometry.size.height
                    width = geometry.size.width
                }
                
                return Color.clear
            }
        )
    }
}

