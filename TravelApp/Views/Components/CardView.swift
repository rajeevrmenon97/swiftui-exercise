//
//  CardView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct CardView: View {
    var width: CGFloat
    var height: CGFloat
    var cardDetails: CardDetails
    
    var body: some View {
        VStack {
            HStack {
                ForEach(cardDetails.tags, id: \.self) { tag in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("\(tag)")
                            .foregroundStyle(.black)
                    })
                    .buttonStyle(.bordered)
                    .tint(.yellow)
                    
                }
                Spacer()
            }
            .padding([.top,.leading,.trailing], width * 0.05)
            
            Spacer()
            
            DetailsView(
                width: width * 0.9,
                height: height * 0.3,
                maxHeight: height * 0.85,
                cardDetails: cardDetails)
                .padding([.bottom,.leading,.trailing], width * 0.05)
        }
        
        .frame(width: width, height: height)
        .background(content: {
            Image("StockBackground")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        })
        .cornerRadius(15)
    }
}

#Preview {
    ContentView()
}
