
import SwiftUI

enum Tabb: String, CaseIterable {
    
    case home = "Analytics"
    case services = "Tools"
    case partners = "Your Podcast"
    
    var systemImage: String {
        
        switch self {
            
        case .home:
            return "chart.bar.fill"
        case .services:
            return "plus"
        case .partners:
            return "person.fill"
        }
    }
    
    var index: Int {
        return Tabb.allCases.firstIndex(of: self) ?? 0
    }
}
