//
//  CustomToggleStyle.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    var option1: String = "Option 1"
    var option2: String = "Option 2"
    var width: CGFloat = 200
    var height: CGFloat = 40
    var backgroundColor: Color = .gray
    var selectedBackgroundColor: Color = .white
    var foregroundColor: Color = .black
    
    init(option1: String, option2: String, width: CGFloat, height: CGFloat, backgroundColor: Color, selectedBackgroundColor: Color, foregroundColor: Color) {
        self.option1 = option1
        self.option2 = option2
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.foregroundColor = foregroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            Capsule()
                .fill(backgroundColor)
                .overlay {
                    Text(configuration.isOn ? option1: option2)
                        .foregroundStyle(foregroundColor)
                        .offset(x: configuration.isOn ? -width/4 : width/4)
                    Capsule()
                        .fill(selectedBackgroundColor)
                        .padding(height * 0.1)
                        .overlay {
                            Text(configuration.isOn ? option2: option1)
                                .foregroundStyle(foregroundColor)
                        }
                        .frame(width: width/2)
                        .offset(x: configuration.isOn ? width/4 : -width/4)
                    
                }
                .frame(width: width, height: height)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
