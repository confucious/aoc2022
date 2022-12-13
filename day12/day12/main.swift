//
//  main.swift
//  day12
//
//  Created by Jerry Hsu on 12/12/22.
//

import Foundation

enum Direction {
    case up, down, left, right
}

struct Point: Equatable, Hashable {
    let x: Int
    let y: Int

    func point(in direction: Direction) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y - 1)
        case .down: return Point(x: x, y: y + 1)
        case .left: return Point(x: x - 1, y: y)
        case .right: return Point(x: x + 1, y: y)
        }
    }
}

struct Map {
    let start: Point
    let end: Point
    let grid: [Point:Int]

    init(input: String) {
        var start: Point?
        var end: Point?
        var grid = [Point:Int]()
        let lines = input.components(separatedBy: "\n")
        lines.enumerated().forEach { (y, line) in
            line.enumerated().forEach { (x, char) in
                switch char {
                case "S":
                    start = Point(x: x, y: y)
                    grid[start!] = 0
                case "E":
                    end = Point(x: x, y: y)
                    grid[end!] = 25
                case "a"..."z":
                    grid[Point(x: x, y: y)] = Int(char.asciiValue!) - 97
                default:
                    fatalError()
                }
            }
        }

        self.start = start!
        self.end = end!
        self.grid = grid
    }
}

func search(_ map: Map, startingAt point: Point) -> Int? {
    var stepMap = [Point:Int]()
    var candidates = Set([point])
    stepMap[map.start] = 0

    var numSteps = 0

    func maybeInclude(point: Point, originHeight: Int) -> Point? {
        if let height = map.grid[point],
            height <= originHeight + 1 {
            return point
        } else {
            return nil
        }
    }

    while !candidates.isEmpty {
        numSteps += 1
        candidates = Set(candidates.flatMap { candidate in
            let originHeight = map.grid[candidate]!
            return [Direction.up, .down, .left, .right]
                .compactMap { direction in
                    maybeInclude(point: candidate.point(in: direction), originHeight: originHeight)
                }
        }.filter { candidate in
            if let steps = stepMap[candidate],
               steps < numSteps {
                return false
            } else {
                return true
            }
        })
        candidates.forEach { candidate in
            stepMap[candidate] = numSteps
        }
    }
    return stepMap[map.end]
}

let map = Map(input: input)
print(search(map, startingAt: map.start))

print(
    map.grid.compactMap { (start, height) in
        if height == 0 {
            return search(map, startingAt: start)
        } else {
            return nil
        }
    }.min()
)

