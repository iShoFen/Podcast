//
//  Int.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import Foundation

extension Int {
    var stringSuffix: String {
        let sign = ((self < 0) ? "-" : "")
        var absNum = abs(Double(self))
        let abbrev = ["", " k", " M", " Md"]
        var index = 0
        
        while absNum >= 1000 && index <= abbrev.count {
            absNum /= 1000
            index += 1
        }
        
        let formatter = NumberFormatter()
        formatter.roundingMode = .up
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = (index > 0) ? 1 : 0

        return "\(sign)\(formatter.string(from: NSNumber(value: absNum)) ?? "")\(abbrev[index])"
    }
}
