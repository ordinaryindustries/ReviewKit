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
    let appId: String
    let count: Int
    let imageName: String
    let color: Color
    let layout: LayoutType
    let showReviewCount: Bool
    let showLaurels: Bool
    let countryCode: String
    
    @StateObject private var reviewManager: ReviewManager
    
    public init(appId: String,
                count: Int = 5,
                imageName: String = "star",
                color: Color = .orange,
                layout: LayoutType = .full,
                showReviewCount: Bool = true,
                showLaurels: Bool = true,
                countryCode: String = "US"
    ) {
        self.appId = appId
        self.count = count
        self.imageName = imageName
        self.color = color
        self.layout = layout
        self.showReviewCount = showReviewCount
        self.showLaurels = showLaurels
        self.countryCode = countryCode
        self._reviewManager = StateObject(wrappedValue: ReviewManager(appId: appId, countryCode: countryCode))
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            switch layout {
            case .full:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }

                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
                }
            case .score:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }

                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
                }
            case .graphical:
                ZStack {
                    ShapeRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    ShapeRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
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

#Preview {
    VStack(spacing: 64) {
        ShapeProgressView(appId: "389801252", layout: .full)

        ShapeProgressView(appId: "389801252", layout: .graphical)

        ShapeProgressView(appId: "389801252", layout: .score)
    }
}
