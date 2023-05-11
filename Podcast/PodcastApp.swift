//
//  PodcastApp.swift
//  Podcast
//
//  Created by etudiant on 09/05/2023.
//

import SwiftUI

@main
struct PodcastApp: App {
    var body: some Scene {
        WindowGroup {
            DetailView(podcast: loadPodcast(index: 0))
        }
    }
}
