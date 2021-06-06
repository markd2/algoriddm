import Foundation

// Toboggan Trajectory
// https://adventofcode.com/2020/day/3

private func loadStuffs(_ filename: String) -> [PasswordPolicy] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n")
      .compactMap { PasswordPolicy(String($0)) }
    return stuff
} // loadStuffs

func aoc3_1() {
    let stuff = loadStuffs("aoc3-test.txt")
}

func aoc3_2() {
    let stuff = loadStuffs("aoc3-test.txt")
}
