//
//  TextFadeWithButton.swift
//  Podcast
//
//  Created by etudiant on 20/05/2023.
//

import SwiftUI

struct TextFadeWithButton: View {
    var background: Color = .white
    var forground: Color = .black
    var descHeight: CGFloat = 0
    
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            LinearGradient(
                gradient: Gradient(colors: [background.opacity(0), background.opacity(1)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: width, height: height)

            Button {} label: {
                Text("PLUS")
                    .foregroundColor(forground)
                    .font(.headline)
                    .modifier(GetHWModifier(height: $height, width: $width))
            }
            .padding(.leading, 10)
            .padding(.top, descHeight - height)
            .background(background)
        }
    }
}

struct TextFadeWithButton_Previews: PreviewProvider {
    static var previews: some View {
        TextFadeWithButton()
    }
}
