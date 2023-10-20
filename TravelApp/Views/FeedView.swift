//
//  FeedView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @State var toggleState = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometryReader in
                VStack {
                    List {
                        ForEach(feedViewModel.cards) { card in
                            if card.isGlobal == toggleState {
                                HStack {
                                    Spacer()
                                    CardView(
                                        width: geometryReader.size.width * 0.9,
                                        height: geometryReader.size.height * 0.8,
                                        cardDetails: card)
                                    .shadow(color: .black, radius: 5, x: 0, y: 5)
                                    Spacer()
                                }
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .frame(alignment: .center)
                    .scrollIndicators(.hidden)
                }
                .background(Color("Sand1"))
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
                            backgroundColor: Color("Terracota1"),
                            selectedBackgroundColor: Color("Terracota2"),
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
        .environmentObject(FeedViewModel())
}
