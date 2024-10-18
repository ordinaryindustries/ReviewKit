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

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct RatingImage: View {
    let imageName: String
    let position: RatingPosition
    let color: Color
    @Binding var value: Double
    let index: Int

    @State private var size: CGSize = .zero

    init(imageName: String, position: RatingPosition = .background, color: Color, value: Binding<Double>, index: Int) {
        self.imageName = imageName
        self.position = position
        self.color = color
        self._value = value
        self.index = index
    }

    var maskRatio: CGFloat {
        let mask = CGFloat(value) - CGFloat(index)

        switch mask {
        case 1...:
            return 1
        case ..<0:
            return 0
        default:
            return mask
        }
    }

    var calculatedImageName: String {
        switch position {
        case .foreground:
            return "\(imageName).fill"
        case .background:
            return "\(imageName).fill"
        }
    }

    var body: some View {
        switch position {
        case .foreground:
            Image(systemName: calculatedImageName)
                .foregroundStyle(color)
                .mask(alignment: .leading) {
                    Rectangle()
                        .frame(width: size.width * maskRatio, height: size.height, alignment: .leading)
                }
                .background(GeometryReader { reader in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: reader.size)
                })
                .onPreferenceChange(SizePreferenceKey.self) { newSize in
                    size = newSize
                }
        case .background:
            Image(systemName: calculatedImageName)
                .foregroundStyle(color)
                .opacity(0.2)
        }
    }
}

struct RatingImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                RatingImage(imageName: "star", position: .foreground, color: .yellow, value: .constant(0.5), index: 0)
                RatingImage(imageName: "star", position: .foreground, color: .orange, value: .constant(1.0), index: 0)
                RatingImage(imageName: "star", position: .foreground, color: .purple, value: .constant(0.7), index: 0)
            }
            .previewDisplayName("Foreground(filled)")
            
            HStack {
                RatingImage(imageName: "star", position: .background, color: .yellow, value: .constant(0.5), index: 0)
                RatingImage(imageName: "star", position: .background, color: .orange, value: .constant(1.0), index: 0)
                RatingImage(imageName: "star", position: .background, color: .purple, value: .constant(0.0), index: 0)
            }
            .previewDisplayName("Background(unfilled)")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
