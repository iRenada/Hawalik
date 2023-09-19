
import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            GradientBackground(
                startColor: Color("LightGray"),
                endColor: Color("BG"),
                startPoint: .center,
                endPoint: .topLeading)
            
            ProgressView("Loading...")
                .foregroundColor(Color("BG"))
                .bold()
                .padding()
                .padding(.top, 650)
                .progressViewStyle(CircularProgressViewStyle(tint: .black.opacity(0.4)))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
