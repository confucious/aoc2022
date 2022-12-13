//
//  main.swift
//  day10
//
//  Created by Jerry Hsu on 12/12/22.
//

import Foundation

enum Op {
    case noop
    case addx(Int)

    init(input: String) {
        let components = input.components(separatedBy: " ")
        switch components[0] {
        case "noop": self = .noop
        case "addx": self = .addx(Int(components[1])!)
        default:
            fatalError("Unknown \(input)")
        }
    }
}

struct State {
    var cycle = 0
    var xDuring = 1
    var xReg = 1

    func process(_ op: Op) -> [State] {
        switch op {
        case .noop:
            return [State(cycle: cycle + 1, xDuring: xReg, xReg: xReg)]
        case .addx(let value):
            return [
                State(cycle: cycle + 1, xDuring: xReg, xReg: xReg),
                State(cycle: cycle + 2, xDuring: xReg, xReg: xReg + value)
            ]
        }
    }
}

func parse(_ input: String) -> [State] {
    let program = input.components(separatedBy: "\n").map { Op(input: $0) }
    var states = [State()]
    for op in program {
        states.append(contentsOf: states.last!.process(op))
    }
    return states
}

func run(input: String) {
    let states = parse(input)
    let samples = stride(from: 20, through: 220, by: 40).map { states[$0] }
    print(samples)
    print(samples.reduce(0) { $0 + ($1.cycle) * $1.xDuring})
}

run(input: sample)
run(input: input)

func run2(input: String) {
    let states = parse(input)
    var buffer = Array(repeating: Array(repeating: ".", count: 40), count: 6)
    for state in states.dropFirst() {
        let colIndex = (state.cycle - 1) % 40
        let rowIndex = (state.cycle - 1) / 40
        if colIndex >= state.xDuring - 1 && colIndex <= state.xDuring + 1 {
            buffer[rowIndex][colIndex] = "#"
        }
    }

    buffer.forEach { line in
        print(line.joined())
    }
}

run2(input: sample)
run2(input: input)
PLULKBZH
