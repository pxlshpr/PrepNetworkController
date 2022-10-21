import Foundation
import PrepUnits

public struct ServerFoodForm: Codable {
    let food: ServerFood
    let barcodes: [ServerBarcode]
    
    public init(food: ServerFood, barcodes: [ServerBarcode]) {
        self.food = food
        self.barcodes = barcodes
    }
}
