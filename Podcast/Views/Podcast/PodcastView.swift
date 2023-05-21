//
//  DetailView.swift
//  Podcast
//
//  Created by etudiant on 11/05/2023.
//

import SwiftUI

struct PodcastView: View {
    var podcast: Podcast
    var topBackground: Color = .clear
    
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    @State private var isTitleVisible = true
    @State private var isHeaderDocked = false
    @State private var downloadWidth: CGFloat = 0
    @State private var downloadHeight: CGFloat = 0
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                topBackground.ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.size.height/2)
                PodcastColors.backgroundPrimary
            }
            ScrollView {
                PodcastHeaderView(podcast: podcast,
                    background: topBackground,
                    isTitleVisible: $isTitleVisible,
                    isHeaderDocked: $isHeaderDocked,
                    selectedPodcastImage: $selectedPodcastImage,
                    selectedEpisodeName: $selectedEpisodeName,
                    selectedEpisodeDate: $selectedEpisodeDate)
                
                EpisodesListView(episodes: podcast.episodes, podcastImage: podcast.image,
                    selectedPodcastImage:
                    $selectedPodcastImage,
                    selectedEpisodeName: $selectedEpisodeName,
                    selectedEpisodeDate: $selectedEpisodeDate)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden)
        .navigationBarColor(isTitleVisible ? .clear : UIColor(PodcastColors.NavBar)
            .withAlphaComponent(isHeaderDocked ? 1 : 0.9))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { presentationMode.wrappedValue.dismiss() } label: {
                    Image(systemName: "chevron.left")
                        .tint(isTitleVisible ? .white : .accentColor)
                        .padding(isTitleVisible ? 10 : 0)
                        .background(isTitleVisible ? PodcastColors.NavBarButton : .clear)
                        .clipShape(Circle())
                    Text(isTitleVisible ? "" : "Podcasts")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(isTitleVisible ? "" : podcast.name)
                    .lineLimit(1)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {} label: {
                    ZStack {
                        Image(systemName: "arrow.down")
                            .tint(isTitleVisible ? .white : .accentColor)
                            .padding(8)
                            .background(isTitleVisible ? PodcastColors.NavBarButton : PodcastColors.NavBar)
                            .clipShape(Circle())
                            .modifier(GetHWModifier(height: $downloadHeight, width: $downloadWidth))
                        
                        Image(systemName: "pause")
                            .resizable()
                            .scaledToFit()
                            .tint(isTitleVisible ? topBackground : PodcastColors.NavBar)
                            .padding(3)
                            .frame(width: downloadWidth / 2.5, height: downloadHeight / 2.5)
                            .background(isTitleVisible ? .white : .accentColor)
                            .clipShape(Circle())
                            .offset(x: downloadWidth / 3, y: downloadHeight / 3.5)
                    }
                }
                .padding(.trailing, -20)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {} label: {
                    Image(systemName: "ellipsis")
                        .tint(isTitleVisible ? .white : .accentColor)
                        .padding(15)
                        .background(isTitleVisible ? PodcastColors.NavBarButton : PodcastColors.NavBar)
                        .clipShape(Circle())
                        .offset(x: 10)
                }
            }
        }
    }
}

struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        let fake: String? = nil
        let binding1 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding2 = Binding<Date?>(get: { date }, set: { _ in })
        PodcastView(podcast: loadPodcast(3), selectedPodcastImage: binding1,
            selectedEpisodeName: binding1,
            selectedEpisodeDate: binding2)
    }
}
