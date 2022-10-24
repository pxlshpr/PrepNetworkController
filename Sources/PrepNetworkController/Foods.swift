import Foundation
import PrepUnits

public extension NetworkController {
    func foods(for results: [FoodSearchResult]) async throws -> [PrepFood] {
        let ids = results.map { $0.id }
        
        let params = PostParamsFoodsForIds(ids: ids)
        let request = try postRequest(for: params, to: .foodsForIds)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let serverFoods = try decoder.decode([ServerFood].self, from: data)
        
        return serverFoods.compactMap {
            PrepFood(serverFood: $0)
        }
    }
}
