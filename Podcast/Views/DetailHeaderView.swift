//
//  DetailHeaderView.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import SwiftUI

struct DetailHeaderView: View {
    var podcast: Podcast?

    private var background: Color {    Color(UIImage(named: podcast?.image ?? "hippocampe-FO")?.averageColor() ?? .clear)
    }
    private var textColor: Color { background.getForegroundColor(myOpacity: 1)
    }
    private var textColorOpacity: Color { background.getForegroundColor(myOpacity: 0.6)
    }
    
    private var buttonColor: Color {
        background.getForegroundColor(myOpacity: 0.9)
    }
    
    var body: some View {
        VStack {
            ImageTitleView(
                textColor: textColor,
                textColorOpacity: textColorOpacity,
                image: podcast?.image ?? "hippocampe-FO",
                title: podcast?.name ?? "name",
                author: podcast?.author ?? "author")
            .scaledToFit()
            
            Button {} label: {
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
            
            Text("\(podcast?.episodes[0].date ?? ""): \(podcast?.episodes[0].title ?? ""):")
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(textColor)
                .bold()
            Text(podcast?.episodes[0].desc ?? "")
                .lineLimit(2)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            RateView(
                rate: 4.9,
                number: 258,
                type: "Affaires",
                color: textColorOpacity)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 3)
        
        }
        .padding()
        .padding(.top, 64)
        .background(background)

    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(podcast:loadPodcast(index: 0))
    }
}
