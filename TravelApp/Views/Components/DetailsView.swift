//
//  DetailsView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI
import LoremSwiftum

struct DetailsView: View {
    var width: CGFloat
    var height: CGFloat
    var maxHeight: CGFloat
    var cardDetails: CardDetails
    
    @State var isExpanded = false
    
    init(width: CGFloat, height: CGFloat, maxHeight: CGFloat, cardDetails: CardDetails) {
        self.width = width
        self.height = height
        self.maxHeight = maxHeight
        self.cardDetails = cardDetails
        print(self.height)
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person.circle")
                    .font(.title3)
                
                Text(cardDetails.author)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "heart")
                Image(systemName: "pin.fill")
                Image(systemName: "bubble.left.and.bubble.right")
                Text("\(cardDetails.numComments)")
                    .font(.caption)
            }
            .padding([.leading, .trailing, .top])
            
            Text(cardDetails.date.formatted(.dateTime.day().month().year()))
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 0.1)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(cardDetails.title)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing])
            
            ScrollViewReader { reader in
                ScrollView {
                    Text(cardDetails.description)
                        .font(.subheadline)
                        .id("description")
                }
                .scrollDisabled(!isExpanded)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding([.leading, .trailing, .bottom])
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                        reader.scrollTo("description", anchor: .top)
                    }
                }
            }
        }
        .frame(width: width, height: isExpanded ? maxHeight: height)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

struct DetailViewPreview: PreviewProvider {
    static var previews: some View {
        DetailsView(
            width: 350,
            height: 200,
            maxHeight: 400,
            cardDetails: CardDetails(
                author: Lorem.fullName,
                date: Date(),
                title: Lorem.title,
                description: Lorem.paragraphs(3)))
    }
}
