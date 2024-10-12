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

@available(*, deprecated, renamed: "RatingView", message: "ShapeProgressView has been renamed to RatingView. ShapeProgressView will be removed in a future version.")
public struct ShapeProgressView: View {
    let appId: String
    let count: Int
    let imageName: String
    let color: Color
    let textColor: Color
    let layout: LayoutType
    let showReviewCount: Bool
    let showLaurels: Bool
    let countryCode: String
    
    @State private var reviewManager: ReviewManager
    
    public init(appId: String,
                count: Int = 5,
                imageName: String = "star",
                color: Color = .orange,
                textColor: Color = .black,
                layout: LayoutType = .full,
                showReviewCount: Bool = true,
                showLaurels: Bool = true,
                countryCode: String = "US"
    ) {
        self.appId = appId
        self.count = count
        self.imageName = imageName
        self.color = color
        self.textColor = textColor
        self.layout = layout
        self.showReviewCount = showReviewCount
        self.showLaurels = showLaurels
        self.countryCode = countryCode
        self._reviewManager = State(wrappedValue: ReviewManager(appId: appId, countryCode: countryCode))
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            switch layout {
            case .full:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                    }
                }
                .font(.largeTitle)
                .fontWeight(.bold)

                ZStack {
                    RatingRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    RatingRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    let reviewCountText = reviewManager.reviewCount > 0
                        ? reviewManager.localizedString(forKey: "rating.reviews.countText", arguments: reviewManager.localizedReviewCount)
                        : reviewManager.localizedString(forKey: "rating.reviews.noReviews")
                    
                    Text(reviewCountText)
                        .foregroundStyle(textColor)
                }
            case .score:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                    }
                }
                .font(.largeTitle)
                .fontWeight(.bold)

                if showReviewCount {
                    let reviewCountText = reviewManager.reviewCount > 0
                        ? reviewManager.localizedString(forKey: "rating.reviews.countText", arguments: reviewManager.localizedReviewCount)
                        : reviewManager.localizedString(forKey: "rating.reviews.noReviews")
                    
                    Text(reviewCountText)
                        .foregroundColor(textColor)
                }

            case .graphical:
                ZStack {
                    RatingRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    RatingRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
                        .foregroundColor(textColor)
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

public struct RatingView: View {
    let appId: String
    let count: Int
    let imageName: String
    let color: Color
    let textColor: Color
    let layout: LayoutType
    let showReviewCount: Bool
    let showLaurels: Bool
    let countryCode: String
    
    @State private var reviewManager: ReviewManager
    
    public init(appId: String,
                count: Int = 5,
                imageName: String = "star",
                color: Color = .orange,
                textColor: Color = .black,
                layout: LayoutType = .full,
                showReviewCount: Bool = true,
                showLaurels: Bool = true,
                countryCode: String = "US"
    ) {
        self.appId = appId
        self.count = count
        self.imageName = imageName
        self.color = color
        self.textColor = textColor
        self.layout = layout
        self.showReviewCount = showReviewCount
        self.showLaurels = showLaurels
        self.countryCode = countryCode
        self._reviewManager = State(wrappedValue: ReviewManager(appId: appId, countryCode: countryCode))
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            switch layout {
            case .full:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                    }
                }
                .font(.largeTitle)
                .fontWeight(.bold)

                ZStack {
                    RatingRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    RatingRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
                        .foregroundColor(textColor)
                }
            case .score:
                HStack {
                    if showLaurels {
                        Image(systemName: "laurel.leading")
                    }

                    Text("\(reviewManager.rating, specifier: "%.1f")")
                        .fontDesign(.rounded)

                    if showLaurels {
                        Image(systemName: "laurel.trailing")
                    }
                }
                .font(.largeTitle)
                .fontWeight(.bold)

                if showReviewCount {
                    Text(reviewManager.reviewCount > 0 ? "Based on \(reviewManager.reviewCount, specifier: "%.0f") reviews" : "No reviews yet")
                        .foregroundColor(textColor)
                }
            case .graphical:
                ZStack {
                    RatingRow(count: count, imageName: imageName, position: .background, color: color, value: $reviewManager.rating)
                    RatingRow(count: count, imageName: imageName, position: .foreground, color: color, value: $reviewManager.rating)
                }
                
                if showReviewCount {
                    let reviewCountText = reviewManager.reviewCount > 0
                        ? reviewManager.localizedString(forKey: "rating.reviews.countText", arguments: reviewManager.localizedReviewCount)
                        : reviewManager.localizedString(forKey: "rating.reviews.noReviews")
                    
                    Text(reviewCountText)
                        .foregroundColor(textColor)
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
    // ID for Instagram
    let appId = "389801252"

    return VStack(spacing: 64) {
        RatingView(appId: appId, layout: .full)

        RatingView(appId: appId, textColor: .blue, layout: .graphical)

        RatingView(appId: appId, textColor: .green, layout: .score)
        
        // MARK - Verifying Backward Compatibility
        ShapeProgressView(appId: appId, textColor: .brown)
    }
}
