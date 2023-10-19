//
//  DetailsView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct DetailsView: View {
    var width: CGFloat
    var height: CGFloat
    var cardDetails: CardDetails
    
    var body: some View {
        VStack {
            
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "person")
                    
                    Text(cardDetails.author)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                    Image(systemName: "pin.fill")
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("\(cardDetails.numComments)")
                        .font(.caption)
                }
                
                HStack {
                    Text(cardDetails.date.formatted(.dateTime.day().month().year()))
                        .font(.caption2)
                    Spacer()
                }
            }
            .padding([.leading, .trailing, .top])
            .frame(width: width, height: height * 0.3)
            
            
            VStack {
                HStack {
                    Text(cardDetails.title)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                .padding([.leading, .trailing])
                
                Text(cardDetails.description)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                
                Spacer()
            }
            .frame(width: width, height: height * 0.8)
        }
        .frame(width: width, height: height)
        .background(.thinMaterial)
        .cornerRadius(15)
    }
}

struct DetailViewPreview: PreviewProvider {
    static var previews: some View {
        DetailsView(width: 350, height: 200,
            cardDetails: CardDetails(author: "Jane Doe", date: Date(), title: "Title", description: "Description"))
    }
}
