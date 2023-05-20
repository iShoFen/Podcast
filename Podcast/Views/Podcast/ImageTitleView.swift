//
//  ContentView.swift
//  Podcast
//
//  Created by etudiant on 09/05/2023.
//

import SwiftUI




struct ImageTitleView: View {
    @Binding var isTitleVisible: Bool
    @State private var height: CGFloat = 0
    @State private var textHeight: CGFloat = 0
    
    var textColor = PodcastColors.ForegroundPrimary
    var textColorOpacity = PodcastColors.ForegroundPrimary
    var podcast: Podcast

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                LazyVStack {
                    Rectangle()
                        .frame(width: 1, height: height - 60)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isTitleVisible = true
                            }
                        }
                        .onDisappear {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isTitleVisible = false
                            }
                        }
                }
                Image(podcast.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .padding(.horizontal, 80)
            }
            .modifier(GetHeightModifier(height: $height))
            Text(podcast.name)
                    .foregroundColor(textColor)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                if let authorImage =  podcast.authorImage {
                    Image(authorImage)
                        .resizable()
                        .frame(width: textHeight, height: textHeight)
                        .clipShape(Circle())
                }
                
                Text(podcast.author)
                    .foregroundColor(textColorOpacity)
                    .font(.title3)
                    .modifier(GetHeightModifier(height: $textHeight))
            
                if (podcast.authorImage != nil) {
                    Button {} label: {
                        Image(systemName: "chevron.right")
                            .tint(textColorOpacity)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let isVisible = true
        let binding = Binding<Bool>(get: { isVisible }, set: { _ in })
        ImageTitleView(isTitleVisible: binding, podcast: loadPodcast(2))
    }
}
