import SwiftUI

struct RainView: View {
    
    
    var body: some View {
        
        GeometryReader{ proxy in
            let size = proxy.size
            
            HStack(spacing: 10){
                ForEach(1...Int(size.width / 25),id: \.self){ _ in
                    RainCharacters(size: size)
                }
            }.padding(.horizontal)
                
        }
        
    }
}

struct RainCharacters: View {
    var size: CGSize
    @State var startAnimation: Bool  = false
    @State var random: Int = 0
    
    var body: some View{
        
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack{
            
           
            
            ForEach(0..<constant.count, id: \.self){ index in
                let character = Array(constant)[getRandomIndex(index: index)]
                
                Text(String(character))
                    .font(.system(size: 25,weight: .light,design: .monospaced))
                    .foregroundColor(.white)
            }
        }
        .mask(alignment: .top){
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                    
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear{
            withAnimation(.linear(duration: 2).delay(.random(in: 0...2)).repeatForever(autoreverses: false)){
                startAnimation = true
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()){ _ in
            random  =  Int.random(in: 0..<constant.count)
        }
    }
    
    func getRandomIndex(index: Int) -> Int{
        let max =  constant.count - 1
        
        if(index + random) > max {
            if(index - random) < 0 {
                return index
            }
            return(index - random)
        }
        else{
            return(index+random)
        }
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: Binary Rain Number
let constant = "1010101010101010101010101010101"
