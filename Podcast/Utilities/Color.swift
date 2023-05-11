//
//  Colors.swift
//  Podcast
//
//  Created by etudiant on 09/05/2023.
//

import Foundation
import SwiftUI

extension Color {
    func getForegroundColor(myOpacity: Double) -> Color {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        let foreground = lum > 0.5 ? Color.black : Color.white
        
        return foreground.opacity(myOpacity)
    }
}
