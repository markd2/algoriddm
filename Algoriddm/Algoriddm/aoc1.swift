import Foundation

// https://adventofcode.com/2020/day/1
// find two entries that sum to 2020 and then multiply them together

func loadStuffs(_ filename: String) -> [Int] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
        .split(separator: "\n")
        .compactMap { Int($0) }
    return stuff
} // loadStuffs


func aoc1_1() {
    let stuff = loadStuffs("aoc1-test.txt")
    print("stuff \(stuff)")
}


func aoc1_2() {
}


