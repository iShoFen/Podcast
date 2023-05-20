//
//  PlayerView.swift
//  Podcast
//
//  Created by etudiant on 19/05/2023.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var selectedPodcastImage: String?
    @Binding var selectedEpisodeName: String?
    @Binding var selectedEpisodeDate: Date?
    
    @State private var height:CGFloat = 0
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter
    }()
    
    var body: some View {
        HStack{
            Image(selectedPodcastImage ?? "")
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .shadow(radius: 10)
                .frame(height: height * 1.5)
            
            VStack(alignment: .leading) {
                Text(selectedEpisodeName ?? "")
                    .lineLimit(1)
                Text(formatter.string(from: selectedEpisodeDate ?? Date()))
                    .foregroundColor(PodcastColors.ForegroundSecondary)
            }
            .modifier(GetHeightModifier(height: $height))
            
            Button {} label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .tint(PodcastColors.ForegroundPrimary)
                    
            }
            .frame(height: height / 1.5)
            .padding(.trailing)
            Button {} label: {
                Image(systemName: "goforward.30")
                    .resizable()
                    .scaledToFit()
                    .tint(PodcastColors.ForegroundPrimary)
            }
            .frame(height: height / 1.5)

        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let image:String? = loadPodcast(0).image
        let binding1 = Binding<String?>(get: { image }, set: { _ in })
        
        let title:String? = loadPodcast(0)
            .episodes.first?.title ?? ""
        let binding2 = Binding<String?>(get: { title }, set: { _ in })
        
        let date = loadPodcast(0)
            .episodes.first?.date ?? Date()
        let binding3 = Binding<Date?>(get: { date }, set: { _ in })
        PlayerView(selectedPodcastImage: binding1, selectedEpisodeName: binding2, selectedEpisodeDate: binding3 )
    }
}
