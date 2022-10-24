import Foundation

public enum Endpoint {
    case search
    case foodsForIds
    
    var path: String {
        switch self {
        case .search:
            return "/foods/search"
        case .foodsForIds:
            return "/foods/ids"
        }
    }
}
