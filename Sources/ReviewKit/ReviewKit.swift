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

struct ShapeProgressView: View {
    let count: Int
    @Binding var value: Double
    let imageName: String
    let color: Color
    
    init(count: Int = 5, value: Binding<Double>, imageName: String = "star", color: Color = .orange) {
        self.count = count
        self._value = value
        self.imageName = imageName
        self.color = color
    }
    
    var body: some View {
        ZStack {
            ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $value)
            ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $value)
        }
    }
}
