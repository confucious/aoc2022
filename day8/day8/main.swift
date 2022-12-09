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
        if x == 0 || x == width - 1 {
            return true
        }
        if y == 0 || y == height - 1 {
            return true
        }
        let testValue = self[x, y]
        if (0 ..< x).allSatisfy({ xIndex in
            self[xIndex, y] < testValue
        }) {
            return true
        }
        if ((x+1) ..< width).allSatisfy({ xIndex in
            testValue > self[xIndex, y]
        }) {
            return true
        }
        if (0 ..< y).allSatisfy({ yIndex in
            self[x, yIndex] < testValue
        }) {
            return true
        }
        if ((y+1) ..< height).allSatisfy({ yIndex in
            testValue > self[x, yIndex]
        }) {
            return true
        }
        return false
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

print(checkVisibility(grid: parse(input)))
