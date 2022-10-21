import Foundation
import PrepUnits

public struct ServerFood: Codable {
    let id: UUID?
    let name: String
    let emoji: String
    let detail: String?
    let brand: String?
    let amount: ServerAmountWithUnit
    let serving: ServerAmountWithUnit
    let nutrients: ServerNutrients
    let sizes: [ServerSize]
    let density: ServerDensity?
    let linkUrl: String?
    let prefilledUrl: String?
    let imageIds: [UUID]?
    
    let type: Int16
    let verificationStatus: Int16?
    let database: Int16?
    
    public init(id: UUID?, name: String, emoji: String, detail: String?, brand: String?, amount: ServerAmountWithUnit, serving: ServerAmountWithUnit, nutrients: ServerNutrients, sizes: [ServerSize], density: ServerDensity?, linkUrl: String?, prefilledUrl: String?, imageIds: [UUID]?, type: Int16, verificationStatus: Int16? = nil, database: Int16? = nil) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.detail = detail
        self.brand = brand
        self.amount = amount
        self.serving = serving
        self.nutrients = nutrients
        self.sizes = sizes
        self.density = density
        self.linkUrl = linkUrl
        self.prefilledUrl = prefilledUrl
        self.imageIds = imageIds
        self.type = type
        self.verificationStatus = verificationStatus
        self.database = database
    }
}
