import Foundation
import PrepUnits

extension NetworkController {
    
    func searchRequest(for params: ServerFoodSearchParams) throws -> URLRequest {
        guard let url = URL(string: "\(baseUrlString)/foods/search") else {
            throw NetworkControllerError.badUrl
        }
        
        var request = URLRequest(url: url)

        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(params)

        request.httpMethod = "POST"
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        return request
    }
    
    public func searchFoods(params: ServerFoodSearchParams) async throws -> FoodsPage {
        let request = try searchRequest(for: params)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(FoodsPage.self, from: data)
    }
}
