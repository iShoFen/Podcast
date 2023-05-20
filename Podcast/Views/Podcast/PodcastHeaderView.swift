//
//  DetailHeaderView.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import SwiftUI

struct PodcastHeaderView: View {
    
    var podcast: Podcast
    var background: Color = .white

    @Binding var isTitleVisible: Bool
    @Binding var isHeaderDocked: Bool
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    @State private var descHeight: CGFloat = 0
    
    private var textColor: Color { background.getForegroundColor(myOpacity: 1)
    }
    private var textColorOpacity: Color { background.getForegroundColor(myOpacity: 0.6)
    }
    
    private var buttonColor: Color {
        background.getForegroundColor(myOpacity: 0.9)
    }
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            ImageTitleView(
                isTitleVisible: $isTitleVisible,
                textColor: textColor,
                textColorOpacity: textColorOpacity,
                podcast: podcast
            )
            .scaledToFit()
            
            Button {
                selectedPodcastImage = podcast.image
                selectedEpisodeName = podcast.episodes.first?.title
                selectedEpisodeDate = podcast.episodes.first?.date
                togglePlayingEpisode(podcast.episodes.first!)
            } label: {
                Label("Dernier épisode",
                      systemImage: "play.fill")
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .bold()
                .padding(.vertical, 16)
            }
            .background(buttonColor)
            .cornerRadius(10)
            .padding(.horizontal, 50)
            
            LazyVStack {
                Text("\(podcast.episodes[0].date.toEpisodeString): \(podcast.episodes[0].title):")
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(textColor)
                    .bold()
               
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isHeaderDocked = false
                        }
                    }
                    .onDisappear {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isHeaderDocked = true
                        }
                    }
            }
            
            Text(podcast.episodes[0].desc)
                .lineLimit(isExpanded ? nil : 2)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(GetHeightModifier(height: $descHeight))
                .overlay(TextFadeWithButton(background: background,
                                            forground: textColor,
                                            descHeight: descHeight), alignment: .trailing)

            RateView(
                rate: CGFloat(podcast.rating),
                number: podcast.number,
                type: podcast.type,
                color: textColorOpacity)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 3)
        
        }
        .padding()
        .background(background)

    }
}

struct PodcastHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let isVisible = true
        let binding1 = Binding<Bool>(get: { isVisible }, set: { _ in })
        
        let fake: String? = nil
        let binding2 = Binding<String?>(get: { fake }, set: { _ in })
        
        let date: Date? = nil
        let binding3 = Binding<Date?>(get: { date }, set: { _ in })
        
        PodcastHeaderView(podcast:loadPodcast(0),
                          isTitleVisible: binding1,
                          isHeaderDocked: binding1,
                          selectedPodcastImage: binding2,
                          selectedEpisodeName: binding2,
                          selectedEpisodeDate: binding3)
    }
}
