//
//  Podcast.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import Foundation

struct Podcast: Hashable {
    let name: String
    let author: String
    let authorImage: String?
    let image: String
    let type: [String]
    let rating: Float
    let number: Int
    var episodes: [Episode]
}
