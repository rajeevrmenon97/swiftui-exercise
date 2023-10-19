//
//  CardDetails.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import Foundation

class CardDetails: Identifiable {
    
    init(author: String, date: Date, title: String, description: String) {
        self.tags = [String]()
        self.author = author
        self.date = date
        self.isLiked = false
        self.title = title
        self.description = description
        self.numComments = 0
        self.bgImageUrl = ""
    }
    
    var id: UUID {UUID()}
    var tags: [String]
    var author: String
    var date: Date
    var isLiked: Bool
    var title: String
    var description: String
    var numComments: Int
    var bgImageUrl: String
}
