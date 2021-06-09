import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Greeble Snorf")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        List {
            Button("Partition") {
                partitionEvensLast()
            }
            Button("AoC") {
                print("florf")
                // aoc1_1()
                // aoc1_2()
                // aoc2_1()
                // aoc2_2()
                // aoc3_1()
                // aoc3_2()
                // aoc4_1()
                aoc4_2()
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
