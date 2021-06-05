import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Greeble Snorf")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        List {
            Button("AoC ") {
                print("florf")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
