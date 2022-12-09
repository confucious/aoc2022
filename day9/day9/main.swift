//
//  main.swift
//  day9
//
//  Created by Jerry Hsu on 12/9/22.
//

import Foundation

struct Point: Equatable, Hashable {
    let x: Int
    let y: Int
}

enum Direction {
    case up, down, left, right
}

struct State {
    var head = Point(x: 0, y: 0)
    var tail = Point(x: 0, y: 0)

    var tailVisited = Set<Point>(arrayLiteral: Point(x: 0, y: 0))

    mutating func moveHead(_ direction: Direction) {
        switch direction {
        case .up: head = Point(x: head.x, y: head.y - 1)
        case .down: head = Point(x: head.x, y: head.y + 1)
        case .left: head = Point(x: head.x - 1, y: head.y)
        case .right: head = Point(x: head.x + 1, y: head.y)
        }

        switch (head.x - tail.x, head.y - tail.y) {
        case (0, 2): tail = Point(x: head.x, y: head.y - 1)
        case (0, -2 ): tail = Point(x: head.x, y: head.y + 1)
        case (2, 0): tail = Point(x: head.x - 1, y: head.y)
        case (-2, 0): tail = Point(x: head.x + 1, y: head.y)
        case (1, 2),
            (2, 1): tail = Point(x: tail.x + 1, y: tail.y + 1)
        case (1, -2),
            (2, -1): tail = Point(x: tail.x + 1, y: tail.y - 1)
        case (-1, -2),
            (-2, -1): tail = Point(x: tail.x - 1, y: tail.y - 1)
        case (-1, 2),
            (-2, 1): tail = Point(x: tail.x - 1, y: tail.y + 1)
        default:
            break
        }
        tailVisited.insert(tail)
    }
}

func parse(_ input: String) -> [(Direction, Int)] {
    return input.components(separatedBy: "\n")
        .map { line in
            let components = line.components(separatedBy: " ")
            let distance = Int(components[1])!
            switch components[0] {
            case "U": return (.up, distance)
            case "D": return (.down, distance)
            case "L": return (.left, distance)
            case "R": return (.right, distance)
            default: fatalError("unknown char")
            }
        }
}

var state = State()

parse(input).forEach { (instruction) in
    (0 ..< instruction.1).forEach { _ in
        state.moveHead(instruction.0)
    }
}
print(state.tailVisited.count)
