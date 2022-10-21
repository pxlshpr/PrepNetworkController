import Foundation
import SwiftUI

public class NetworkController {
    
    let isLocal = true
    
    var baseUrlString: String {
        isLocal ? "http://127.0.0.1:8083" : "https://pxlshpr.app/prep"
    }
    
    public static var shared = NetworkController()
    
    public func postRequest(for serverFoodForm: ServerFoodForm) -> URLRequest? {
        guard let url = URL(string: "\(baseUrlString)/foods") else {
            return nil
        }

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(serverFoodForm)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            return request
        } catch {
            print("Error encoding: \(error)")
            return nil
        }
    }

    public func postRequest(forImageData imageData: Data, imageId: UUID) -> URLRequest? {
        return postRequest(forImageData: imageData, imageId: imageId)
    }
    
    public func postRequest(forImageData imageData: Data, imageId: UUID) -> URLRequest {
        let boundary = "Boundary-\(UUID().uuidString)"

        var request = URLRequest(url: URL(string: "\(baseUrlString)/foods/image")!)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = NSMutableData()

        let formFields = ["id": imageId.uuidString]

        for (key, value) in formFields {
            httpBody.appendString(convertFormField(named: key, value: value, using: boundary))
        }

        httpBody.append(convertFileData(fieldName: "data",
                                        fileName: "\(imageId.uuidString).jpg",
                                        mimeType: "image/jpg",
                                        fileData: imageData,
                                        using: boundary))

        httpBody.appendString("--\(boundary)--")

        request.httpBody = httpBody as Data
        return request
    }
    
    func convertFormField(named name: String, value: String, using boundary: String) -> String {
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"

        return fieldString
    }
    
    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
        let data = NSMutableData()

        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
        data.appendString("Content-Type: \(mimeType)\r\n\r\n")
        data.append(fileData)
          data.appendString("\r\n")

        return data as Data
    }
}
