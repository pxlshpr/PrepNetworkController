import Foundation

public struct FoodSearchResponse: Codable {
    public let results: [FoodSearchResult]
    public let page: Int
    public let hasMorePages: Bool
}

