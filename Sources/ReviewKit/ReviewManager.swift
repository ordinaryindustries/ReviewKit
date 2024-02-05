//
//
// 
//
// Created by Ordinary Industries on 2/5/24.
// Copyright (c) 2023 Ordinary Industries. All rights reserved.
//
// Twitter: @OrdinaryInds
// TikTok: @OrdinaryInds
//


import Foundation

struct AppStoreResponse: Codable {
    let results: [AppData]
}

struct AppData: Codable {
    let isGameCenterEnabled: Bool
    let screenshotUrls: [String]
    let artworkUrl512: String
    let artworkUrl100: String
    let ipadScreenshotUrls: [String]
    let artistViewUrl: String
    let appletvScreenshotUrls: [String]
    let artworkUrl60: String
    let supportedDevices: [String]
    let advisories: [String]
    let features: [String]
    let kind: String
    let minimumOsVersion: String
    let trackViewUrl: String
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let formattedPrice: String
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Double
    let averageUserRating: Double
    let trackContentRating: String
    let trackId: Double
    let trackName: String
    let genreIds: [String]
    let description: String
    let currency: String
    let sellerName: String
    let primaryGenreName: String
    let primaryGenreId: Double
    let isVppDeviceBasedLicensingEnabled: Bool
    let bundleId: String
    let currentVersionReleaseDate: String
    let releaseDate: String
    let artistId: Double
    let artistName: String
    let genres: [String]
    let price: Double
    let version: String
    let wrapperType: String
    let userRatingCount: Double
}

public enum AppStoreResponseError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class ReviewManager: ObservableObject {
    @Published var rating: Double
    @Published var reviewCount: Double
    @Published var isLoading: Bool
    let appId: String
    let countryCode: String
    
    public init(rating: Double = 0, reviewCount: Double = 0, isLoading: Bool = false, appId: String, countryCode: String) {
        self.rating = rating
        self.reviewCount = reviewCount
        self.isLoading = isLoading
        self.appId = appId
        self.countryCode = countryCode
    }
    
    var roundedRating: Double {
        let remainder = rating.truncatingRemainder(dividingBy: 0.5)
        return rating - remainder
    }
    
    func fetchAppStoreRating() async throws {
        print("Fetching App Store rating.")
        DispatchQueue.main.async { self.isLoading = true }
        
        // The URL for the api endpoint.
        let endpoint = "http://itunes.apple.com/lookup?id=\(appId)&country=\(countryCode)"
        
        // Try creating a URL object with the endpoint url. If we cannot make the URL return.
        guard let url = URL(string: endpoint) else {
            DispatchQueue.main.async { self.isLoading = false }
            throw AppStoreResponseError.invalidURL
        }
        
        // Fetch the data.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Ensure the call was successful by checking the HTTP status code.
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            DispatchQueue.main.async { self.isLoading = false }
            throw AppStoreResponseError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(AppStoreResponse.self, from: data)
            if let appData = responseData.results.first {
                print(appData.averageUserRating)
                DispatchQueue.main.async {
                    self.rating = appData.averageUserRatingForCurrentVersion
                    self.reviewCount = appData.userRatingCountForCurrentVersion
                }
                print("Fetched App Store rating.")
            }
        } catch {
            DispatchQueue.main.async { self.isLoading = false }
            throw AppStoreResponseError.invalidData
        }
        DispatchQueue.main.async { self.isLoading = false }
    }
}
