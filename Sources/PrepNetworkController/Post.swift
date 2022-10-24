import Foundation
import PrepUnits

extension NetworkController {
    func postRequest(for codable: Codable, to endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: "\(baseUrlString)\(endpoint.path)") else {
            fatalError("Throw error here")
        }
        
        var request = URLRequest(url: url)

        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(codable)

        request.httpMethod = "POST"
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        return request
    }
}  
