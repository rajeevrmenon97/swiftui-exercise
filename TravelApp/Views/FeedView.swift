//
//  FeedView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct FeedView: View {
    var cards = [CardDetails]()
    @State var toggleState = false
    
    init() {
        let card1 = CardDetails(author: "John Doe", date: Date(), title: "John's card", description: "Long description john")
        card1.tags = ["RCC", "Experience", "Class"]
        let card2 = CardDetails(author: "Jane Doe", date: Date(), title: "Jane's card", description: "Long description john")
        card2.tags = ["RCC", "Restaurant", "Italian"]
        cards.append(card1)
        cards.append(card2)
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack {
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title)
                    Spacer()
                    Toggle(isOn: $toggleState, label: {})
                        .toggleStyle(CustomToggleStyle(
                            option1: "Stay Local",
                            option2: "Go Global",
                            width: geometryReader.size.width * 0.5,
                            height: geometryReader.size.height * 0.05,
                            backgroundColor: .secondary,
                            selectedBackgroundColor: .white,
                            foregroundColor: .primary))
                    Spacer()
                    Image(systemName: "person.circle")
                        .font(.title)
                } .padding([.leading, .trailing], geometryReader.size.width * 0.06)
                ScrollView {
                    LazyVStack {
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
                }
                .frame(alignment: .center)
                .scrollIndicators(.hidden)
            }
            
        }
    }
}

#Preview {
    FeedView()
}
