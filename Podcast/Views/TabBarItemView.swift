//
//  TabBarItemView.swift
//  Podcast
//
//  Created by etudiant on 19/05/2023.
//

import SwiftUI

struct TabBarItemView: View {
    
    var podcasts: [Podcast] = []

    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    var body: some View {
        VStack {
            PodcastsLibraryView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
            if ((selectedEpisodeName) != nil) {
                PlayerView(selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
            }
        }.background(PodcastColors.NavBar)
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })
        
        TabBarItemView(selectedPodcastImage: binding1, selectedEpisodeName: binding1, selectedEpisodeDate: binding2)
    }
}
