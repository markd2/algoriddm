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


func aoc3_1() {
    let stuff = loadStuffs("aoc3-test.txt")
    print(stuff)
}

func aoc3_2() {
    let stuff = loadStuffs("aoc3-test.txt")
}
