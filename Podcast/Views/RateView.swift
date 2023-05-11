//
//  RateView.swift
//  Podcast
//
//  Created by etudiant on 10/05/2023.
//

import SwiftUI

struct RateView: View {
    var rate: CGFloat = 4.5
    var number: Int = 1000 
    var type = "type"
    var color = Color.black
    
    private var fRate: String {
        String(format: "%.1f", rate).replacingOccurrences(of: ".", with: ",")
    }
    
    var body: some View {
        HStack {
            Image(systemName:"star.fill")
            Text(fRate)
                .bold()
            Text("(\(number.stringSuffix))")
            Text("•  \(type)")
        }
        .font(.footnote)
        .foregroundColor(color)
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView()
    }
}
