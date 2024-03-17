//
//  CardView.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 17/03/24.
//

import SwiftUI

struct CardViews: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) { // Adjust spacing between cards
                CardView(imageName: "my-etickets", title: "My e-tickets", subtitle: "There aren't any yet.", subtitleColor: Color.gray, actionText: "Retrieve here")
                CardView(imageName: "park-hours", title: "Park Hours", subtitle: "Today, 13 Feb\n10am - 5pm", subtitleColor: Color.black, actionText: "plan my visit")
            }
            .padding()
        }
    }
}

struct CardView: View {
    let imageName: String
    let title: String
    let subtitle: String
    let subtitleColor: Color
    let actionText: String
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.6))
                Spacer()
                Image(imageName)
            }
            Spacer()
            Text(subtitle)
                .font(.body)
                .foregroundColor(subtitleColor)
            Spacer()
            Text(actionText)
                .font(.caption)
                .foregroundColor(.red)
        }.padding(16)
        .frame(width: 150, height: 150) // Fixed size for each card
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardViews()
    }
}
