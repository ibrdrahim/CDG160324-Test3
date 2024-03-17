//
//  DetailView.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 17/03/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image("detail-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame( height: 200)
                    .clipped()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("close")
                        .foregroundColor(.white)
                }.padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            VStack(alignment: .leading){
                Text("Zone 1")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.top,8)
                
                Text("Aligator Gal")
                    .font(.title)
                    .padding(.top,8)
                HStack{
                    HStack {
                        Image("distance")
                            .foregroundColor(.black)
                            .padding(.leading,8)
                        
                        Text("410m away")
                            .font(.caption)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical, 8)
                            .padding(.trailing, 8)
                        
                        Text("Map")
                            .font(.caption)
                            .foregroundColor(.pink)
                            .padding(.trailing, 8)
                    }
                    .background(Color.white)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 0.5)
                    )
                    .cornerRadius(8)
                    Spacer()
                }
                Text("Gars are easily distinguished from other freshwater species by their long, slender, cylindrical bodies, long snouts, and diamond-shaped interlocking (ganoid) scales. The tail fin is rounded. Dorsal and anal fins are placed well back on the body and nearly opposite each other. Alligator gar is the largest of the gar species. It can grow up to 8 feet long and weigh more than 300 pounds. Adults have two rows of large teeth on either side of the upper jaw. Coloration is generally brown or olive above and lighter underneath. The species name spatula is Latin for \"spoon\", referring to the creature's broad snout.")
                    .padding(.top,8)
                    .font(.body)
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    DetailView()
}
