import Foundation

public struct FoodSearchResult: Codable, Identifiable {
    public let id: UUID
    public let name: String
}
