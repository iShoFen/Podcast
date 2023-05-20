//
//  Episode.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import Foundation

class Episode: Hashable, ObservableObject {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.title == rhs.title &&
        lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(date)
    }
    
    let date: Date
    let title: String
    let desc: String
    let time: TimeInterval
    @Published var isPlaying = false
    
    init(date: Date, title: String, desc: String, time: TimeInterval) {
        self.date = date
        self.title = title
        self.desc = desc
        self.time = time
    }
}
