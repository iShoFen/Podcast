//
//  TabBarView.swift
//  Podcast
//
//  Created by etudiant on 18/05/2023.
//

import SwiftUI

struct TabBarView: View {
    
    var podcasts: [Podcast] = []
    @State private var selectedPodcastImage: String? = nil
    @State private var selectedEpisodeName: String? = nil
    @State private var selectedEpisodeDate: Date? = nil

    var body: some View {
        TabView {
            Group {
                TabBarItemView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                .tabItem {
                    Label("Écouter", systemImage: "play.circle")
                }
                
                TabBarItemView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                .tabItem {
                    Label("Explorer", systemImage: "square.grid.2x2")
                }
                
                TabBarItemView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                .tabItem {
                    Label("Bibliotèque", systemImage: "square.stack")
                }
                
                TabBarItemView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                .tabItem {
                    Label("Recherche", systemImage: "magnifyingglass")
                }
            }
        }
        .tint(PodcastColors.ForegroundTertiary)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(podcasts: loadAllPodcasts())
    }
}
