
import SwiftUI

struct Homee: View {
    
    // View Properties
    @State private var activeTab: Tabb = .home
    @Namespace private var animation
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $activeTab) {
                Text("Services")
                    .tag(Tabb.home)
                // Hiding Native Tab Bar
                    .toolbar (.hidden, for: .tabBar)
                Text("Services")
                    .tag(Tabb.services)
                // Hiding Native Tab Bar
                toolbar(.hidden, for: .tabBar)
                Text("Partners")
                    .tag(Tabb.partners)
                // Hiding Native Tab Bar
                    .toolbar(.hidden, for: .tabBar)
            }
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("BG"), _ inactiveTint: Color = .white) ->
    some View {
        // Moving all the Remaining Tab Item's to Bottom
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tabb.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            Rectangle()
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration:  0.7), value: activeTab)
    }
}

// Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tabb
    var animation: Namespace.ID
    //    var animation: Color
    @Binding var activeTab: Tabb
    
    var body: some View {
        
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
            // Increasing Size for the Active Tab
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabBar()
    }
}
