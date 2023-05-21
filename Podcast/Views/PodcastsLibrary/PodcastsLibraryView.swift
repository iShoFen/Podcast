//
//  PodcastView.swift
//  Podcast
//
//  Created by etudiant on 18/05/2023.
//

import SwiftUI

struct PodcastsLibraryView: View {
        
    var podcasts: [Podcast] = []

    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    PodcastsListView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                    
                    PodcastsListView(podcasts: podcasts, selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)                }.padding()
            }
            .navigationTitle("Podcast")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {} label: {
                        Image(systemName: "chevron.left")
                        Text("Bibliotèque")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {} label: {
                        Image(systemName: "ellipsis")
                            .padding(15)
                            .background(PodcastColors.NavBar)
                            .clipShape(Circle())
                            .offset(x: 10)
                    }
                }
            }
            .toolbarBackground(PodcastColors.NavBar)
        }
    }
}

struct PodcastsLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })
        
        PodcastsLibraryView(podcasts: loadAllPodcasts(), selectedPodcastImage: binding1, selectedEpisodeName: binding1, selectedEpisodeDate: binding2)
    }
}
