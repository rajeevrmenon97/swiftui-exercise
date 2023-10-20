//
//  CardDetails.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import Foundation

class CardDetails: Identifiable, Decodable, Encodable {
    
    init(author: String, date: Date, title: String, description: String) {
        self.tags = [String]()
        self.author = author
        self.date = date
        self.title = title
        self.description = description
        self.numComments = 0
        self.bgImageUrl = ""
        self.isLiked = false
        self.isPinned = false
        self.isGlobal = false
    }
    
    var id: UUID {UUID()}
    var tags: [String]
    var author: String
    var date: Date
    var title: String
    var description: String
    var numComments: Int
    var bgImageUrl: String
    var isLiked: Bool
    var isPinned: Bool
    var isGlobal: Bool
}
