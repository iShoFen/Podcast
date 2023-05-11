//
//  DetailView.swift
//  Podcast
//
//  Created by etudiant on 11/05/2023.
//

import SwiftUI

struct DetailView: View {
    var podcast: Podcast?
    
    var body: some View {
        VStack {
            ScrollView {
                DetailHeaderView(podcast: podcast)
                    .padding(.bottom, -16)
                   
                HStack {
                    Text("Épisodes")
                        .foregroundColor(PodcastColors.ForegroundPrimary)
                        .font(.title)
                        .bold()
                        
                    Button {} label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(PodcastColors.ForegroundTertiary)
                    }
                            
                    Button {} label: {
                        Text("Tout voir")
                            .foregroundColor(PodcastColors.ForegroundTertiary)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom, -32)

                ForEach(podcast?.episodes ?? [], id: \.self) { episode in
                    EpisodeView(episode: episode)
                }
            }
        }
        .background(PodcastColors.backgroundPrimary)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(podcast: loadPodcast(index: 2))
    }
}
