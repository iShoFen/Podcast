//
//  EpisodeView.swift
//  Podcast
//
//  Created by etudiant on 11/05/2023.
//

import SwiftUI

struct EpisodeView: View {
    @ObservedObject var episode: Episode
    var podcastImage : String?
    
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
            
    var body: some View {
        VStack {
            Divider()
                .background(PodcastColors.Divider)
                .scaleEffect(CGSize(width: 1, height: 4))
                .padding(.trailing, -16)
                .padding(.bottom)
            
            HStack {
                if (episode.isPlaying) {
                    Text("....")
                        .font(.title3)
                        .foregroundColor(PodcastColors.ForegroundSecondary)
                        .bold()
                }
                Text(episode.date.toEpisodeString.uppercased())
                    .foregroundColor(PodcastColors.ForegroundSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
 
            VStack {
                Text(episode.title)
                    .foregroundColor(PodcastColors.ForegroundPrimary)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
                        
                Text(episode.desc)
                    .foregroundColor(PodcastColors.ForegroundSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(3)
            }            

            HStack {
                Button {
                    selectedPodcastImage = podcastImage
                    selectedEpisodeName = episode.title
                    selectedEpisodeDate = episode.date
                    togglePlayingEpisode(episode)
                } label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(PodcastColors.ForegroundTertiary)
                        .padding(10)
                }
                .background(PodcastColors.Button)
                .cornerRadius(20)
                
                if episode.isPlaying {
                    ProgressView(value: 0.01)
                        .accentColor(PodcastColors.ForegroundTertiary)
                    Text("Il reste")
                        .foregroundColor(PodcastColors.ForegroundTertiary)
                }
                

                Text(episode.time.formatToString)
                    .foregroundColor(PodcastColors.ForegroundTertiary)
                
                Button {} label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(PodcastColors.ForegroundSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }.frame(maxWidth: .infinity, alignment: .leading)
        
        }
        .padding(.trailing)
        .padding(.leading)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })

        EpisodeView(episode: loadPodcast(0).episodes[0], selectedPodcastImage: binding1, selectedEpisodeName: binding1, selectedEpisodeDate: binding2)
    }
}
