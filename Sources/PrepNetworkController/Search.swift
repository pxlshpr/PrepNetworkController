//import Foundation
//import PrepDataTypes
//
//extension NetworkController {
//    
//    public func searchFoods(params: ServerFoodSearchParams) async throws -> FoodsPage {
//        let request = try postRequest(for: params, to: .search)
////        let request = try searchRequest(for: params)
//        let (data, _) = try await URLSession.shared.data(for: request)
//        let decoder = JSONDecoder()
//        return try decoder.decode(FoodsPage.self, from: data)
//    }
//    
//    public func findFood(for barcodeStrings: [String]) async throws -> PrepFood {
//        let params = PostParamsBarcodes(payloads: barcodeStrings)
//        let request = try postRequest(for: params, to: .barcodesSearch)
//        let (data, _) = try await URLSession.shared.data(for: request)
//        let decoder = JSONDecoder()
//        let serverFood = try decoder.decode(ServerFood.self, from: data)
//        guard let prepFood = PrepFood(serverFood: serverFood) else {
//            throw NetworkControllerError.couldNotConvertServerFoodToPrepFood
//        }
//        return prepFood
//    }
//}
