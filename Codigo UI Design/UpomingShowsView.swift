//
//  UpomingShows.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 17/03/24.
//

import SwiftUI

struct UpcomingShow: Identifiable {
    let id = UUID()
    let time: String
    let title: String
    let imageName: String
}

let upcomingShows: [UpcomingShow] = [
    UpcomingShow(time: "10:00 AM", title: "Morning Show", imageName: "show_1"),
    UpcomingShow(time: "02:00 PM", title: "Afternoon Concert", imageName: "show_2"),
    UpcomingShow(time: "07:00 PM", title: "Evening Drama", imageName: "show_3")
]

struct UpcomingShowsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Upcoming Shows")
                .font(.headline)
                Spacer()
                Text("View all")
                    .font(.callout)
                    .foregroundColor(.red)
            }.padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(upcomingShows) { show in
                        UpcomingShowView(upcomingShow: show)
                            .frame(width: UIScreen.main.bounds.width * 0.7)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct UpcomingShowView: View {
    let upcomingShow: UpcomingShow

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.black)
                        .padding(.leading,8)
                    
                    Text(upcomingShow.time)
                        .font(.caption)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 8)
                        .padding(.trailing, 8)
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            Spacer()
            Text(upcomingShow.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .background(
            Image(upcomingShow.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(Color.black.opacity(0.4))
                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7 * 0.7) // Assuming 70% of screen width
                .cornerRadius(10)
        )
        .frame(width: UIScreen.main.bounds.width * 0.7,height: 200)
        .clipped()
        .cornerRadius(10)
        .shadow(radius: 2.5)
    }
}


struct UpcomingShowView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingShowsView()
    }
}

