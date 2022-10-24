import Foundation

public enum Endpoint {
    case search
    case foodsForIds
    case barcodesSearch
    
    var path: String {
        switch self {
        case .search:
            return "/foods/search"
        case .foodsForIds:
            return "/foods/ids"
        case .barcodesSearch:
            return "/foods/barcodes"
        }
    }
}
