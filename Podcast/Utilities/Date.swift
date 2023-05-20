//
//  self.swift
//  Podcast
//
//  Created by etudiant on 20/05/2023.
//

import Foundation

extension Date {
    var toEpisodeString: String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(self) {
            return "Aujourd'hui"
        }
        
        if calendar.isDateInYesterday(self) {
            return "Hier"
        }
        
        if calendar.isDate(self, equalTo: now, toGranularity: .weekOfYear) {
            let selfFormatter = DateFormatter()
            selfFormatter.dateFormat = "EEEE" // Renvoie le jour de la semaine
            
            return selfFormatter.string(from: self)
        }
        
        if calendar.isDate(self, equalTo: now, toGranularity: .year) {
            let selfFormatter = DateFormatter()
            selfFormatter.dateFormat = "dd MMMM"
            
            return selfFormatter.string(from: self)
        }
        
        let selfFormatter = DateFormatter()
        selfFormatter.dateFormat = "dd/MM/yyyy"
        
        return selfFormatter.string(from: self)
    }
}
