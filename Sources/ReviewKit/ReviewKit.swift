//
//
//
//
// Created by Ordinary Industries on 2/4/24.
// Copyright (c) 2023 Ordinary Industries. All rights reserved.
//
// Twitter: @OrdinaryInds
// TikTok: @OrdinaryInds
//

import SwiftUI

public struct ShapeProgressView: View {
    let count: Int
    @Binding var value: Double
    let imageName: String
    let color: Color
    let showScore: Bool
    
    public init(count: Int = 5, value: Binding<Double>, imageName: String = "star", color: Color = .orange, showScore: Bool = true) {
        self.count = count
        self._value = value
        self.imageName = imageName
        self.color = color
        self.showScore = showScore
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            if showScore {
                Text("\(value, specifier: "%.1f")")
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            ZStack {
                ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $value)
                ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $value)
            }
        }
    }
}
