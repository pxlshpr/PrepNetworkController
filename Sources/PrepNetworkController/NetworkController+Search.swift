import Foundation
import PrepUnits

extension NetworkController {
    
    public func searchFoods(params: ServerFoodSearchParams) async throws -> FoodsPage {
        let urlString = params.url(baseUrlString)
        guard let url = URL(string: urlString) else {
            throw NetworkControllerError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(FoodsPage.self, from: data)
    }
    
}

extension ServerFoodSearchParams {
    func url(_ baseUrlString: String) -> String {
        "\(baseUrlString)/foods/search?searchText=\(string)&page=\(page)&per=\(per)"
    }
}
