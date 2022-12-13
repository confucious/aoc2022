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
    var xReg = 1

    func process(_ op: Op) -> [State] {
        switch op {
        case .noop:
            return [State(cycle: cycle + 1, xReg: xReg)]
        case .addx(let value):
            return [
                State(cycle: cycle + 1, xReg: xReg),
                State(cycle: cycle + 2, xReg: xReg + value)
            ]
        }
    }
}

func run(input: String) {
    let program = input.components(separatedBy: "\n").map { Op(input: $0) }
    var states = [State()]
    for op in program {
        states.append(contentsOf: states.last!.process(op))
    }
    let samples = stride(from: 19, through: 219, by: 40).map { states[$0] }
    print(samples)
    print(samples.reduce(0) { $0 + ($1.cycle + 1) * $1.xReg})
}

run(input: sample)
run(input: input)
