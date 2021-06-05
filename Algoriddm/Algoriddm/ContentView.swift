import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Greeble Snorf")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        List {
            Button("Partition") {
                partitionEvensLast()
            }
            Button("AoC ") {
                print("florf")
                aoc1_1()
            }
        }
    }
}


func partitionEvensLast() {
    var blah = [1,2,3,4,5,6,7,8]
    
    let hoover = blah.partition(by: { ($0 % 2) == 0 })
    print("GOT pivot \(hoover) with partition \(blah)")
    print("   first half \(blah[..<hoover])")
    print("   second half \(blah[hoover...])")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
