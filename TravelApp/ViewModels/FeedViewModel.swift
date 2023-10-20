//
//  FeedViewModel.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import Foundation
import LoremSwiftum

class FeedViewModel: ObservableObject {
    
    @Published var cards: [CardDetails]
    
    init() {
        cards = [CardDetails]()
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
}
