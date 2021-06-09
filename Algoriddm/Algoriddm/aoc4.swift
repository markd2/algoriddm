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

    mutating func accumulate(_ line: String) {
        let chunks = line.split(separator: ":")
        fields[String(chunks[0])] = String(chunks[1])
    }

    var isValid: Bool {
        let requiredFields = [
          "byr",
          "iyr",
          "eyr",
          "hgt",
          "hcl",
          "ecl",
          "pid"
        ]
        // "cid" is optional"
        var count = 0
        requiredFields.forEach { field in
            if let _ = fields[field] {
                count += 1
            }
        }
        return count >= 7
    }
}


private func loadStuffs(_ filename: String) -> [Passport] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n", omittingEmptySubsequences: false)
      .compactMap { String($0) }

    var current = Passport()
    var passports: [Passport] = []

    stuff.forEach { line in
        line.split(separator: " ").forEach() { field in
            current.accumulate(String(field))
        }
        if line.isEmpty {
            passports.append(current)
            current = Passport()
        }
    }

    passports.append(current)

    return passports
} // loadStuffs


func aoc4_1() {
    let passports = loadStuffs("aoc4-data.txt").dropLast() // don't include trailing newline

    let valid = passports.filter { $0.isValid }

    print("got \(passports.count), valid \(valid.count)")
}


func aoc4_2() {
    let stuff = loadStuffs("aoc4-test.txt")
}
