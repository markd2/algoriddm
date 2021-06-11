import Foundation

private func loadStuffs(_ filename: String) -> [String] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n")
      .compactMap { String($0) }
    return stuff
} // loadStuffs


func seatID(for instructions: String) -> Int {
    let rowInstructions = instructions.prefix(7)
    let seatInstructions = instructions.suffix(3)

    var lowRow = 0
    var highRow = 127
    for x in rowInstructions {
        switch x {
        case "F":
            highRow -= (highRow - lowRow) / 2 + 1
        case "B":
            lowRow += (highRow - lowRow) / 2 + 1
        default:
            return -666
        }
    }

    var lowSeat = 0
    var highSeat = 7
    for x in seatInstructions {
        switch x {
        case "R":
            lowSeat += (highSeat - lowSeat) / 2 + 1
       case "L":
            highSeat -= (highSeat - lowSeat) / 2 + 1
        default:
            return -667
        }
    }

    guard lowRow == highRow, lowSeat == highSeat else {
        return -668
    }

    let id = lowRow * 8 + lowSeat

    return id
}

func aoc5_1() {
    let stuff = loadStuffs("aoc5-data.txt")

    var maxID = 0

    for seat in stuff {
        let id = seatID(for: seat)
        maxID = max(maxID, id)
    }
    print("MAX \(maxID)")
}

func aoc5_2() {
//    let stuff = loadStuffs("aoc5-test.txt")     
}
