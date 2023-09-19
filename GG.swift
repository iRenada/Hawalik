
import SwiftUI

struct GG: View {
    
    @State private var vibrateOnRing = false
    @State private var vibrateOnSilent = true
    
    @State private var inputText: String = ""
    @State private var emailAddress: String = ""

    var body: some View {
        
        VStack{
            Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
            
            TextField("Enter numbers only", text: $inputText)
                .keyboardType(.numberPad)
            
            TextField("user-name@example.com", text: $emailAddress)
                .keyboardType(.emailAddress)

        }
        .toggleStyle(.switch)
    }
    
}

struct GG_Previews: PreviewProvider {
    static var previews: some View {
        GG()
    }
}
