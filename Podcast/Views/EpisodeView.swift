//
//  EpisodeView.swift
//  Podcast
//
//  Created by etudiant on 11/05/2023.
//

import SwiftUI

struct EpisodeView: View {
    var episode: Episode?
    
    var body: some View {
        VStack {
            Divider()
                .background(PodcastColors.Divider)
                .scaleEffect(CGSize(width: 1, height: 2))
                .padding(.trailing, -16)
                .padding(.bottom)
            
            Text(episode?.date ?? "date")
                .foregroundColor(PodcastColors.ForegroundSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(episode?.title ?? "title")
                .foregroundColor(PodcastColors.ForegroundPrimary)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                    
            Text(episode?.desc ?? "dec")
                .foregroundColor(PodcastColors.ForegroundSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(3)

            HStack {
                Button {} label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(PodcastColors.ForegroundTertiary)
                        .padding(10)
                }
                .background(PodcastColors.Button)
                .cornerRadius(20)
                
                Text(episode?.time.formatToString ?? "1 s")
                    .foregroundColor(PodcastColors.ForegroundTertiary)
                
                Button {} label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(PodcastColors.ForegroundSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }.frame(maxWidth: .infinity, alignment: .leading)
        
        }
        .padding()
        .padding(.bottom, -32)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode: loadPodcast(index: 0).episodes[0])
    }
}
