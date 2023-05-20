//
//  TimeInterval.swift
//  Podcast
//
//  Created by etudiant on 11/05/2023.
//

import Foundation

extension TimeInterval {
    var formatToString: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        
        guard let formattedInterval = formatter.string(from: self) else {
            return ""
        }
        
        let components = formattedInterval.components(separatedBy: " ")
        let joinedComponents = components.joined(separator: " et ")

        return joinedComponents
            .replacingOccurrences(of: "h", with: " h")
            .replacingOccurrences(of: "m( |$)|min( |$)", with: " min", options: .regularExpression)
            .replacingOccurrences(of: "s", with: " s")
    }
}
