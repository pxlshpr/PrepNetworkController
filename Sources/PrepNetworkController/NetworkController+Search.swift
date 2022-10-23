import Foundation
import PrepUnits

extension NetworkController {
    
    public func searchFoods(with string: String, page: Int = 1, per: Int = 25) async throws -> FoodsPage {
        let urlString = "\(baseUrlString)/foods/?searchText=\(string)&page=\(page)&per=\(per)"
        guard let url = URL(string: urlString) else {
            throw NetworkControllerError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(FoodsPage.self, from: data)
    }

}
