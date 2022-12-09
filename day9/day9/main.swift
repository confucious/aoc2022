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

    func move(_ direction: Direction) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y - 1)
        case .down: return Point(x: x, y: y + 1)
        case .left: return Point(x: x - 1, y: y)
        case .right: return Point(x: x + 1, y: y)
        }
    }

    func follow(lead: Point) -> Point {
        let head = lead
        var tail = self

        switch (head.x - tail.x, head.y - tail.y) {
        case (0, 2): tail = Point(x: head.x, y: head.y - 1)
        case (0, -2 ): tail = Point(x: head.x, y: head.y + 1)
        case (2, 0): tail = Point(x: head.x - 1, y: head.y)
        case (-2, 0): tail = Point(x: head.x + 1, y: head.y)
        case (1, 2),
            (2, 1),
            (2, 2): tail = Point(x: tail.x + 1, y: tail.y + 1)
        case (1, -2),
            (2, -1),
            (2, -2): tail = Point(x: tail.x + 1, y: tail.y - 1)
        case (-1, -2),
            (-2, -1),
            (-2, -2): tail = Point(x: tail.x - 1, y: tail.y - 1)
        case (-1, 2),
            (-2, 1),
            (-2, 2): tail = Point(x: tail.x - 1, y: tail.y + 1)
        default:
            print("Ignored \(head.x - tail.x), \(head.y - tail.y)")
            break
        }
        return tail
    }

}

enum Direction {
    case up, down, left, right
}

struct State {
    var head = Point(x: 0, y: 0)
    var node1 = Point(x: 0, y: 0)
    var node2 = Point(x: 0, y: 0)
    var node3 = Point(x: 0, y: 0)
    var node4 = Point(x: 0, y: 0)
    var node5 = Point(x: 0, y: 0)
    var node6 = Point(x: 0, y: 0)
    var node7 = Point(x: 0, y: 0)
    var node8 = Point(x: 0, y: 0)
    var tail = Point(x: 0, y: 0)

    var tailVisited = Set<Point>(arrayLiteral: Point(x: 0, y: 0))

    mutating func moveHead(_ direction: Direction) {
        head = head.move(direction)
        node1 = node1.follow(lead: head)
        print(node1)
        node2 = node2.follow(lead: node1)
        node3 = node3.follow(lead: node2)
        node4 = node4.follow(lead: node3)
        node5 = node5.follow(lead: node4)
        node6 = node6.follow(lead: node5)
        node7 = node7.follow(lead: node6)
        node8 = node8.follow(lead: node7)
        tail = tail.follow(lead: node8)

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
