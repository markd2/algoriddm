import SwiftUI
import Algorithms

struct ContentView: View {
    var body: some View {
        Text("Greeble Snorf")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        List {
            Button("MinMax") {
                minmax()
            }
            Button("Unique") {
                unique()
            }
//            Button("Trimming") {
//                trimming()
//            }
//            Button("Random Sample") {
//                randomSample()
//            }
//            Button("Compacted") {
//                compacted()
//            }
//            Button("Product") {
//                product()
//            }
//            Button("Chain") {
//                chainz()
//            }
//            Button("Cycles") {
//                cycles()
//            }
//            Button("Partition") {
//                partitionEvensLast()
//            }
//            Button("Combination") {
//                combinations()
//            }
//            Button("AoC") {
//                print("florf")
//                aoc1_1()
//                aoc1_2()
//                // aoc2_1()
//                // aoc2_2()
//                // aoc3_1()
//                // aoc3_2()
//                // aoc4_1()
//                // aoc4_2()
//                aoc5_1()
//                // aoc5_2()
//            }
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


func combinations() {
    let blah = ["hello", "greeble", "bork", "fnord"]

    print("Combinations")
    for combo in blah.combinations(ofCount: 3) {
        print(combo)
    }

    print("Permutations")
    for combo in blah.permutations(ofCount: 3) {
        print(combo)
    }
}


func chainz() {
    let closedRange = 3...45
    let openRange = 1..<3
    let numbz = [2, 4, 23, 1, 17]

    let chain1 = chain(numbz, closedRange)
    print(chain1)

    let chain2 = chain(openRange, closedRange)
    print(chain2)
}


func cycles() {
    for x in (1...3).cycled(times: 2) {
        print(x)
    }

    for (odd, n) in zip([true, false].cycled(times: 5), 1...) {
        print("\(n) is odd? \(odd)")
    }
}


func product() {
    let oop = ["greeble", "hoover", "fnord", "tele"]
    let ack = ["bork", "blah", "ook"]

    for (blah, borf) in product(oop, ack) {
        print("\(blah) \(borf)")
    }
}


func compacted() {
    let array: [String?] = ["hoover", nil, nil, "greeble", "fnord", nil, "oopack"]
    let blah = array.compacted()
    
    blah.forEach { oopack in
        print(oopack)
    }
}


func randomSample() {
    let source = [ "bork", "flonk", "fnord", "greeble", "ni-peng", "ni-wommm", "hoover"]

    let unstableSample = source.randomSample(count: 3)
    print(unstableSample)

    let stableSample = source.randomStableSample(count: 4)
    print(stableSample)
}


func trimming() {
    let splunge = "      Greebl, Bork  "
    print("|\(splunge)|")
    let nospace = splunge.trimming(while: \.isWhitespace)
    print("|\(nospace)|")

    let results = [3, 6, 9, 1, 2, 3, 33, 36, 39].trimming(while: { $0.isMultiple(of: 3) })
    print(Array(results))
}


func unique() {
    let numbs = [1, 2, 3, 4, 1, 2, 5, 4, 2, 1, 5, 2, 1, 1, 2, 3, 1]
    let unique = Array(numbs.uniqued())
    print(unique)
}


func minmax() {
    let numbers = [7, 1, 6, 2, 8, 3, 9]
    if let (smallest, largest) = numbers.minAndMax(by: <) {
        print("Got \(smallest) and \(largest)")
    }
}
