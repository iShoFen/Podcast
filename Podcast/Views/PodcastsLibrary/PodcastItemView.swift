//
//  PodcastItemView.swift
//  Podcast
//
//  Created by etudiant on 18/05/2023.
//

import SwiftUI

struct PodcastItemView: View {
    
    var image = "hippocampe-FO"
    var title = "title"
    var lastUpdate: Date = Date()
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
            Text(title)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(PodcastColors.ForegroundPrimary)
            Text("Mise à jour \(lastUpdate)")
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(PodcastColors.ForegroundSecondary)
        }
    }
}

struct PodcastItemView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastItemView()
    }
}
