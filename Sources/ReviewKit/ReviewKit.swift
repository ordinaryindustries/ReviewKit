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
    let imageName: String
    let color: Color
    let layout: LayoutType
    
    @StateObject private var reviewManager = ReviewManager(appId: "6448406354")
    
    public init(count: Int = 5, imageName: String = "star", color: Color = .orange, layout: LayoutType = .full) {
        self.count = count
        self.imageName = imageName
        self.color = color
        self.layout = layout
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            switch layout {
            case .full:
                Text("\(reviewManager.rating, specifier: "%.1f")")
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
            case .score:
                Text("\(reviewManager.rating, specifier: "%.1f")")
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            case .graphical:
                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
            }
        }
        .task {
            do {
                try await reviewManager.fetchAppStoreRating()
            } catch AppStoreResponseError.invalidData {
                print("Trying to fetch App Store rating failed due to invalid data.")
            } catch AppStoreResponseError.invalidURL {
                print("Trying to fetch App Store rating failed due to invalid URL.")
            } catch AppStoreResponseError.invalidResponse {
                print("Trying to fetch App Store rating failed due to invalid response.")
            } catch {
                print("Trying to fetch App Store rating failed due to an unknown error.")
            }
        }
    }
}
