//
//  HomeView.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 16/03/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentIndex = 0
    @State private var progressIndex = 0
    @State private var isShowingDetail = false
    
    let images = ["slide_1", "slide_2", "slide_3"] // Replace with your image names
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Button {
                        ///
                    } label: {
                        Image(systemName: "chevron.left")
                            .renderingMode(.template)
                            .foregroundColor(AppColor.primary)
                    }
                    Spacer()
                    Button {
                        ///TODO
                    } label: {
                        Image("logo")
                    }
                    Spacer()
                    Button {
                        ///TODO
                    } label: {
                        Image("notification")
                    }
                }
                .padding()
                ZStack {
                    Image(images[currentIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( height: 200)
                        .clipped()
                        .overlay(Color.black.opacity(0.3))
                    VStack(alignment: .leading){
                        Spacer()
                        Group{
                            Text("Dont miss our")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Daily dive Feeding!")
                                .font(.title3)
                                .foregroundColor(.white)
                        }.padding(.leading)
                        Spacer()
                        HStack{
                            Spacer()
                            HStack(spacing: 5) {
                                ProgressBar(value: progressIndex > 0 ? 1 : 0)
                                ProgressBar(value: progressIndex > 1 ? 1 : 0)
                                ProgressBar(value: progressIndex > 2 ? 1 : 0)
                            }
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5).padding(.bottom,10)
                            Spacer()
                        }
                    }
                    
                }
                .onTapGesture {
                    isShowingDetail.toggle()
                }
                .frame(height: 200)
                .onReceive(timer) { _ in
                    withAnimation {
                        if self.progressIndex == 3 {
                            self.currentIndex = (self.currentIndex + 1) % self.images.count
                            self.progressIndex = 0
                        } else {
                            self.progressIndex += 1
                        }
                    }
                }
                MenuView()
                CardViews()
                UpcomingShowsView()
            }
        }
        .sheet(isPresented: $isShowingDetail) {
            // Display the detail sheet when isShowingDetail is true
            // Display the details of the tapped slide
            DetailView()
        }
    }
}

struct ProgressBar: View {
    var value: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.7)
                    .foregroundColor(Color.white)
                
                Rectangle()
                    .frame(width: min(self.value * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(AppColor.primary)
            }
            .cornerRadius(45.0)
        }
    }
}

#Preview {
    HomeView()
}

