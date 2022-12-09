//
//  main.swift
//  day8
//
//  Created by Jerry Hsu on 12/9/22.
//

import Foundation

let sample = """
30373
25512
65332
33549
35390
"""

struct Point: Equatable, Hashable {
    let x: Int
    let y: Int
}

struct Grid {
    let width: Int
    let height: Int
    let grid: [Point:Int]

    subscript(x: Int, y: Int) -> Int {
        return grid[Point(x: x, y: y)]!
    }

    func isVisible(x: Int, y: Int) -> Bool {
        let testValue = self[x, y]

        return x == 0 || x == width - 1
        || y == 0 || y == height - 1
        || (0 ..< x).allSatisfy({ xIndex in
            self[xIndex, y] < testValue
        })
        || ((x+1) ..< width).allSatisfy({ xIndex in
            testValue > self[xIndex, y]
        })
        || (0 ..< y).allSatisfy({ yIndex in
            self[x, yIndex] < testValue
        })
        || ((y+1) ..< height).allSatisfy({ yIndex in
            testValue > self[x, yIndex]
        })
    }

    func score(x: Int, y: Int) -> Int {
        if x == 0 || x == width - 1 || y == 0 || y == height - 1 {
            return 0
        }
        var total = 1
        let testValue = self[x, y]
        total *= (1 + (stride(from: x - 1, through: 0, by: -1).enumerated().first { (_, xIndex) in
            self[xIndex, y] >= testValue
        }?.offset ?? x-1))
        total *= (1 + (stride(from: y - 1, through: 0, by: -1).enumerated().first { (_, yIndex) in
            self[x, yIndex] >= testValue
        }?.offset ?? y-1))
        total *= (1 + (stride(from: x + 1, through: width - 1, by: 1).enumerated().first { (_, xIndex) in
            self[xIndex, y] >= testValue
        }?.offset ?? width - x - 2))
        total *= (1 + (stride(from: y + 1, through: width - 1, by: 1).enumerated().first { (_, yIndex) in
            self[x, yIndex] >= testValue
        }?.offset ?? height - y - 2))

        return total
    }
}

func parse(_ input: String) -> Grid {
    let rows = input.components(separatedBy: "\n")
    var grid = [Point:Int]()
    let height = rows.count
    let width = rows[0].count
    rows.enumerated().forEach { (y, row) in
        return row.enumerated().forEach { (x, char) in
            grid[Point(x: x, y: y)] = Int(String(char))!
        }
    }
    return Grid(width: width, height: height, grid: grid)
}


func checkVisibility(grid: Grid) -> Int {
    var visible = 0
    for x in 0 ..< grid.width {
        for y in 0 ..< grid.height {
            visible += grid.isVisible(x: x, y: y) ? 1 : 0
        }
    }
    return visible
}

func findHighestScore(grid: Grid) -> Int {
    var maxValue = 0
    for x in 0 ..< grid.width {
        for y in 0 ..< grid.height {
            maxValue = max(maxValue, grid.score(x: x, y: y))
        }
    }
    return maxValue
}

print(checkVisibility(grid: parse(input)))

let grid = parse(sample)

print(findHighestScore(grid: parse(input)))
