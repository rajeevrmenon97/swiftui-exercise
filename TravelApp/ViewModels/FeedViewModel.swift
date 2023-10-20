//
//  FeedViewModel.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import Foundation
import LoremSwiftum

class FeedViewModel: ObservableObject {
    
    @Published var cards = [CardDetails]()
    
    private static var mockDataCount = 10
    
    init() {
        Task {
            try await loadMockData()
        }
    }
    
    private static func mockDataFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("mock.data")
    }
    
    private func loadMockData() async throws {
        let task = Task<[CardDetails], Error> {
            let fileURL = try Self.mockDataFileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let cards = try JSONDecoder().decode([CardDetails].self, from: data)
            return cards
        }
        
        let mockCards = try await task.value
        
        if mockCards.isEmpty {
            var randomCards = [CardDetails]()
            for _ in 1...Self.mockDataCount {
                randomCards.append(generateMockCard())
                randomCards.append(generateMockCard(true))
            }
            try await writeMockData(mockCards: randomCards)
            self.cards = randomCards
        } else {
            self.cards = mockCards
        }
    }
    
    private func writeMockData(mockCards: [CardDetails]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(mockCards)
            let outfile = try Self.mockDataFileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
    func generateMockCard(_ isGlobal: Bool = false) -> CardDetails {
        let card = CardDetails(
            author: Lorem.fullName,
            date: Date(),
            title: Lorem.title,
            description: Lorem.paragraphs(3))
        card.tags = [Lorem.word, Lorem.word, Lorem.word]
        card.isGlobal = isGlobal
        return card
    }
    
    func saveMockData() async throws {
        try await writeMockData(mockCards: cards)
    }
}
