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
    
    @State var isExpanded: Bool
    @State var isLiked: Bool
    @State var isPinned: Bool
    
    @EnvironmentObject var feedViewModel: FeedViewModel
    
    init(width: CGFloat, height: CGFloat, cardDetails: CardDetails) {
        self.width = width
        self.height = height
        self.cardDetails = cardDetails
        self.isExpanded = false
        self.isLiked = cardDetails.isLiked
        self.isPinned = cardDetails.isPinned
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person.circle")
                    .font(.title3)
                
                Text(cardDetails.author)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: isLiked ? "heart.fill": "heart")
                    .onTapGesture {
                        isLiked.toggle()
                        cardDetails.isLiked.toggle()
                        Task {
                            try await feedViewModel.saveMockData()
                        }
                    }
                
                Image(systemName: isPinned ? "pin.fill": "pin")
                    .onTapGesture {
                        isPinned.toggle()
                        cardDetails.isPinned.toggle()
                        Task {
                            try await feedViewModel.saveMockData()
                        }
                    }
                
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
        .frame(width: width, height: isExpanded ? height * 0.85: height * 0.3)
        .background(.ultraThinMaterial.shadow(.drop(color: .black, radius: 20)))
        .cornerRadius(15)
    }
}

#Preview {
    ContentView()
}
