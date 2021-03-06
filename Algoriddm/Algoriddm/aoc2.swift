import Foundation
import Algorithms

// https://adventofcode.com/2020/day/2

// each line is
//   1-3 a: abcde
// first fields are the password policy, and then the password
// count how many are valid

struct PasswordPolicy {
    let low: Int
    let high: Int
    let letter: String
    let password: String

    init(_ record: String) {
        let chunks = record.split(separator: " ")

        let rangeChunks = String(chunks[0]).split(separator: "-")
        self.low = Int(rangeChunks[0])!
        self.high = Int(rangeChunks[1])!

        self.letter = String(String(chunks[1]).prefix(1))
        self.password = String(chunks[2])
    }

    /// lowest and higehst number of times a given letter must appear
    /// so [1-3 a] is the password must contain `a` at least 1 time and at most 3 times.
    var isValid_oldPolicy: Bool {
        let letters = password.filter { String($0) == self.letter}
        return letters.count >= low && letters.count <= high
    }

    /// lowest and highest are two positions in the password (one-index)
    /// Exactly one of these positions must contain the given letter
    var isValid_newPolicy: Bool {
        var count = 0
        if password.intDig(low - 1) == letter { count += 1 }
        if password.intDig(high - 1) == letter { count += 1 }

        return count == 1
    }
}

private func loadStuffs(_ filename: String) -> [PasswordPolicy] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n")
      .compactMap { PasswordPolicy(String($0)) }
    return stuff
} // loadStuffs


func aoc2_1() {
    let stuff = loadStuffs("aoc2-data.txt")
    let valid = stuff.filter { $0.isValid_oldPolicy }.count
    print("VLAID \(valid)")
}


func aoc2_2() {
    let stuff = loadStuffs("aoc2-data.txt")
    let valid = stuff.filter { $0.isValid_newPolicy }.count
    print("VLAID \(valid)")
}
