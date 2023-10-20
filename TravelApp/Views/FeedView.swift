//
//  FeedView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI
import LoremSwiftum

struct FeedView: View {
    var cards = [CardDetails]()
    @State var toggleState = false
    
    init() {
        let card1 = CardDetails(
            author: "John Doe",
            date: Date(),
            title: "Post 1",
            description: Lorem.paragraphs(3))
        card1.tags = ["RCC", "Experience", "Class"]
        
        let card2 = CardDetails(
            author: "Jane Doe",
            date: Date(),
            title: "Post 2",
            description: Lorem.paragraphs(3))
        card2.tags = ["RCC", "Restaurant", "Italian"]
        
        cards.append(card1)
        cards.append(card2)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometryReader in
                VStack {
                    List {
                        ForEach(cards) { card in
                            HStack {
                                Spacer()
                                CardView(
                                    width: geometryReader.size.width * 0.9,
                                    height: geometryReader.size.height * 0.8,
                                    cardDetails: card)
                                Spacer()
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                    .frame(alignment: .center)
                    .scrollIndicators(.hidden)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title)
                }
                ToolbarItem(placement: .principal) {
                    Toggle(isOn: $toggleState, label: {})
                        .toggleStyle(CustomToggleStyle(
                            option1: "Stay Local",
                            option2: "Go Global",
                            width: 200,
                            height: 40,
                            backgroundColor: .secondary,
                            selectedBackgroundColor: .white,
                            foregroundColor: .primary))
                }
                ToolbarItem(placement: .primaryAction) {
                    Image(systemName: "person.circle")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
