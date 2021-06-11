import Foundation
import Algorithms

// https://adventofcode.com/2020/day/1

private func loadStuffs(_ filename: String) -> [Int] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
        .split(separator: "\n")
        .compactMap { Int($0) }
    return stuff
} // loadStuffs


/// part the first - find two entries that sum to 2020 and then multiply them together
func aoc1_1() {
    let stuff = loadStuffs("aoc1-data.txt")

    for perm in stuff.permutations(ofCount: 2) {
        if perm[0] + perm[1] == 2020 {
            let solution = perm[0] * perm[1]
            print("FOUND IT \(solution)")
            break
        }
    }
}

/// part the second
func aoc1_2() {
    let stuff = loadStuffs("aoc1-data.txt")

//    spoon: for (index1, thing1) in stuff.enumerated() {
//        for (index2, thing2) in stuff.enumerated() {
//            for (index3, thing3) in stuff.enumerated() {
//                if index1 == index2 { continue }
//                if index2 == index3 { continue }
//                if index1 == index3 { continue }
//                
//                if thing1 + thing2 + thing3 == 2020 {
//                    let solution = thing1 * thing2 * thing3
//                    print("FOUND IT \(solution)")
//                    break spoon
//            }
//        }
//    }
//}

    let start = CFAbsoluteTimeGetCurrent()
    for perm in stuff.combinations(ofCount: 3) {
        if perm[0] + perm[1] + perm[2] == 2020 {
            let solution = perm[0] * perm[1] * perm[2]
            let end = CFAbsoluteTimeGetCurrent()
            print("FOUND IT \(solution) time \(end - start)")
            break
        }
   }

}


