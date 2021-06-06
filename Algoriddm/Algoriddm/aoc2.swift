import Foundation
import Algorithms

// https://adventofcode.com/2020/day/1

func loadStuffs(_ filename: String) -> [Int] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
        .split(separator: "\n")
        .compactMap { Int($0) }
    return stuff
} // loadStuffs


func aoc2_1() {
}


func aoc2_2() {
}
