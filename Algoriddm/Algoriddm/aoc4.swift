import Foundation

// Passport Processing
// https://adventofcode.com/2020/day/3

// provided a set of key/value pairs, one or more per line, with fields of a passport.
// Passports separated by a blank line
// e.g.
//   ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
//   byr:1937 iyr:2017 cid:147 hgt:183cm
//
//   iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
//   hcl:#cfa07d byr:1929

// part 1 is to make sure that all eight fields are present, unless the missing
// field is `cid`, in which case ignore it.  Count valid passports

struct Passport {
    var fields: [String: String] = [:]

    func accumulate(_ line: String) {
    }

    var isValid: Bool {
        return true
    }
}


private func loadStuffs(_ filename: String) -> [String] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n")
      .compactMap { String($0) }
    return stuff
} // loadStuffs


func aoc4_1() {
    let stuff = loadStuffs("aoc4-test.txt")
    print("SNORGLE")
}


func aoc4_2() {
    let stuff = loadStuffs("aoc4-test.txt")
}
