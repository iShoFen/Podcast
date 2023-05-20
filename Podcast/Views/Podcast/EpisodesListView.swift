//
//  DetailListView.swift
//  Podcast
//
//  Created by etudiant on 17/05/2023.
//

import SwiftUI

struct EpisodesListView: View {
    
    var episodes: [Episode] = []
    var podcastImage : String?
    
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    var body: some View {
        LazyVStack(pinnedViews: .sectionHeaders) {
            Section(header:
                HStack {
                        Text("Épisodes")
                            .foregroundColor(PodcastColors.ForegroundPrimary)
                            .font(.title)
                            .bold()
                            
                        Button {} label: {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button {} label: {
                            Text("Tout voir")
                                .font(.title3)
                        }
                            
                            
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, -16)
                .background(PodcastColors.backgroundPrimary)
            ) {
                ForEach(episodes, id: \.self) { episode in
                    EpisodeView(episode: episode,
                                podcastImage: podcastImage,
                                selectedPodcastImage: $selectedPodcastImage, selectedEpisodeName: $selectedEpisodeName, selectedEpisodeDate: $selectedEpisodeDate)
                }
            }
        }.background(PodcastColors.backgroundPrimary)
    }
}

struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })

        EpisodesListView(episodes: loadPodcast(0)
            .episodes, selectedPodcastImage: binding1,
                         selectedEpisodeName: binding1, selectedEpisodeDate: binding2)
    }
}
