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
        // "cid" is optional
        var count = 0
        requiredFields.forEach { field in
            if let _ = fields[field] {
                count += 1
            }
        }
        return count >= 7
    }

    var isValid2: Bool {
        typealias Validator = (String) -> Bool
        let requiredFields: [String : Validator] = [
          "byr" : { s in
              if let birthYear = Int(s) {
                  if birthYear >= 1920 && birthYear <= 2002 { return true }
              }
              return false
          },
          "iyr" : { s in
              if let issueYear = Int(s) {
                  if issueYear >= 2010 && issueYear <= 2020 { return true }
              }
              return false
          },
          "eyr" : { s in
              if let expirationYear = Int(s) {
                  if expirationYear >= 2020 && expirationYear <= 2030 { return true }
              }
              return false
          },
          "hgt" : { s in
              guard let height = Int(s.dropLast(2)) else { return false }
              let trailing = s.suffix(2)
              if trailing == "cm" {
                  if height >= 150 && height <= 193 { return true }
              } else if trailing == "in" {
                  if height >= 59 && height <= 76 { return true }
              }
              return false
          },
          "hcl" : { s in
              guard s.prefix(1) == "#" else { return false }
              let hairColor = s.dropFirst(1)
              guard hairColor.count == 6 else { return false }
              if let _ = Int(hairColor, radix: 16) {
                  return true
              }
              return false
          },
          "ecl" : { s in // eye color
              return [
                "amb",
                "blu",
                "brn",
                "gry",
                "grn",
                "hzl",
                "oth"].contains(s)
          },
          "pid" : { s in
              guard s.count == 9 else { return false }
              return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: s))
          }
        ]

        // "cid" is optional
        var count = 0

        requiredFields.forEach { (field, validator) in
            if validator(fields[field] ?? "") {
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
    let passports = loadStuffs("aoc4-data.txt")

    let valid = passports.filter { $0.isValid2 }

    print("got \(passports.count), valid \(valid.count)")
}
