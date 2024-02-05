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

public enum LayoutType {
    case full, score, graphical
}

public struct ShapeProgressView: View {
    let count: Int
    @Binding var value: Double
    let imageName: String
    let color: Color
    let layout: LayoutType
    
    public init(count: Int = 5, value: Binding<Double>, imageName: String = "star", color: Color = .orange, layout: LayoutType = .full) {
        self.count = count
        self._value = value
        self.imageName = imageName
        self.color = color
        self.layout = layout
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            switch layout {
            case .full:
                Text("\(value, specifier: "%.1f")")
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $value)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $value)
                }
            case .score:
                Text("\(value, specifier: "%.1f")")
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            case .graphical:
                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $value)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $value)
                }
            }
        }
    }
}
