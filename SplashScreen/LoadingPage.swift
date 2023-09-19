
import SwiftUI

struct LoadingPage: View {
    
    @State private var showLoading = false
    @State private var isActive = false
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            if isActive{
                OnBoarding()
                
            } else {
                
                ZStack{
                    Color("BG").edgesIgnoringSafeArea(.all)
                        .overlay(
                            showLoading ? LoadingView() : nil
                        )
                        .onAppear{
                            showLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                showLoading = false
                            }
                        }
                } .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LoadingPage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPage()
    }
}

