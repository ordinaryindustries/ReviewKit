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

struct RatingRow: View {
    let count: Int
    let imageName: String
    let position: RatingPosition
    let color: Color
    @Binding var value: Double

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<count, id: \.self) { index in
                    RatingImage(imageName: imageName, position: position, color: color, value: $value, index: index)
                }
            }
        }
    }
}
