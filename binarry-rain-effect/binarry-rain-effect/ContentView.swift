import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color.black
            
            RainView()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
