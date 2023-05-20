//
//  PodcastsListView.swift
//  Podcast
//
//  Created by etudiant on 18/05/2023.
//

import SwiftUI

struct PodcastsListView: View {

    var podcasts: [Podcast] = []
    
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
        
    var body: some View {
        ForEach(podcasts, id: \.self) { podcast in
            NavigationLink(destination:
                            PodcastView(
                                podcast: podcast,
                                topBackground: Color(
                                    UIImage(named: podcast.image)?.getDominantColor() ?? .blue),
                                selectedPodcastImage: $selectedPodcastImage,
                                selectedEpisodeName: $selectedEpisodeName,
                                selectedEpisodeDate:$selectedEpisodeDate))
            {
                PodcastItemView(image: podcast.image, title: podcast.name, lastUpdate: podcast.episodes.first?.date ?? Date())
            }
            // need to send the color here to avoir calclate it twice with the background and podcast header
        }
    }
}

struct PodcastsListView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })
    
        PodcastsListView(podcasts: loadAllPodcasts(),
        selectedPodcastImage: binding1, selectedEpisodeName: binding1, selectedEpisodeDate: binding2)
    }
}
