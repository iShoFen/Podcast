//
//  ContentView.swift
//  Podcast
//
//  Created by etudiant on 09/05/2023.
//

import SwiftUI




struct ImageTitleView: View {
    var textColor = PodcastColors.ForegroundPrimary
    var textColorOpacity = PodcastColors.ForegroundPrimary
    var image = "hippocampe-FO"
    var title = "title"
    var author = "author"
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.horizontal, 80)
                .padding(.top, 20)
            Text(title)
                .foregroundColor(textColor)
                .font(.title2)
                .bold()
            Text(author)
                .foregroundColor(textColorOpacity)
                .font(.title3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitleView()
    }
}
