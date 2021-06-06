import Foundation

// Toboggan Trajectory
// https://adventofcode.com/2020/day/3

// provided with a grid that will be tesselated horizontally
//
// ..##.......
// #...#...#..
// .#....#..#.
// ..#.#...#.#
// .#...##..#.
// 
// . are open squares, # are trees / monoliths / obstacle of your choice.
//
// Move kind of like a knight down (three across, one down).  Following
// that slope, how many trees will you encoutner

private func loadStuffs(_ filename: String) -> [String] {
    let url = Bundle.main.url(forResource: filename.deletingPathExtension,
                               withExtension: filename.pathExtension)!
    let stuff = try! String(contentsOf: url, encoding: .utf8)
      .split(separator: "\n")
      .compactMap { String($0) }
    return stuff
} // loadStuffs


func traverseStuffCountingTrees(_ stuff: [String], 
                                deltaH: Int, deltaV: Int, deltaDawn: Int = 0) -> Int {
    // assumes uniform width of lines
    let width = stuff[0].count
    var treeCount = 0

    var horizontalPosition = 0

    for index in stride(from: 1, to: stuff.count, by: deltaV) {
        let line = stuff[index]

        horizontalPosition += deltaH
        let here = line.intDig(horizontalPosition % width)

        print("looking at line \(index)  hpos \(horizontalPosition)  mod \(horizontalPosition % width) got \(here)")

        if here == "#" {
            treeCount += 1
        }
    }

    return treeCount
}

func aoc3_1() {
    let stuff = loadStuffs("aoc3-data.txt")
    
    let treeCount = traverseStuffCountingTrees(stuff, deltaH: 3, deltaV: 1)
    print("found \(treeCount)")
}

func aoc3_2() {
    let stuff = loadStuffs("aoc3-test.txt")
}
