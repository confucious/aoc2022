//
//  main.swift
//  day2
//
//  Created by Jerry Hsu on 12/2/22.
//

import Foundation

let input = """
C Z
C Y
B X
A Z
C Z
B X
C Z
B Z
A Z
A Z
B Z
B X
C Z
C Z
A Z
B Y
B X
C Y
B X
B X
A Y
A Z
A Z
A Z
A Z
C Z
A Z
C Z
B X
A X
A Z
B Y
B X
A Z
B X
C Z
A Z
C Z
A Z
A Z
B X
C X
B X
A X
B X
A Z
A Z
B X
B Y
B Y
B Y
C Z
A Z
A Z
C X
B X
C Y
B X
C Z
A Z
C Z
B X
B X
B Z
B X
A Z
C Z
A Z
A Z
A Z
A Z
B X
C Z
C Y
A Z
A Z
A Z
A Z
C Z
A X
A Z
A Z
C Z
C Y
A Z
C Y
A Z
A Z
C Y
C Z
C Z
A Z
B Y
B X
B Y
C Z
A Z
A Z
A Z
B Z
C Z
A Z
B X
C Y
A Z
B X
A Z
B Z
A Z
B X
A Z
B Y
A Z
A Z
C Y
A Z
B Z
A Z
A Y
B Y
C Z
A Z
B X
C Z
C Z
B X
C Z
C Z
A Z
B X
C Z
C Z
A Z
C Y
A Z
A Z
B Y
C Y
A Z
B X
B Y
B X
B X
A Z
C Y
A Z
C Y
A Z
B Y
C Z
A Z
A Z
C Y
A Z
A Z
C Z
A Z
A Z
A Z
C Y
A Z
B X
C Z
A Z
C Z
B Z
C Z
A Z
C Y
B X
C Z
C Z
A Z
C Y
A Z
B Y
B X
A Z
C Y
C Z
B X
C X
B X
C Y
B X
B X
C Z
B X
A Z
C X
A Z
C Z
B X
C Y
A Z
A Z
C Z
C Y
A Z
A Z
A Z
B X
A Y
B X
C X
C Z
B X
C Z
C X
A Z
C Z
B Z
A X
A Z
C Y
A Z
C Z
C Z
B X
C Z
A X
C Y
C Z
C Z
C Z
B Y
C X
B X
A Z
B Y
A Z
A Z
C Y
A Z
B X
A Y
A Y
C Y
A Z
A Z
C Z
A Z
A Z
A Z
B Y
B X
B X
A Z
C X
C Y
A Z
C Z
A Z
A Z
A Z
A Z
A X
A Z
C Z
A Z
B Y
A Y
A Y
C Y
C Y
B X
B Y
A Z
A Z
C X
A Z
B X
C Y
A Y
A Y
A Z
C Y
C Z
B X
A Z
C Y
B X
C Z
A Z
B X
A Z
C Y
B X
C Z
A Z
A Z
A Y
A Z
A Z
C Y
C Z
A Z
B X
C Z
C Y
A Z
A Z
C Y
A Z
C Z
B X
A Z
C Z
A Z
A Z
A Z
C Y
C Y
B X
B Z
B X
A Z
B Y
B Y
A Z
A Z
A Z
B Y
B Y
C Y
A Y
A Z
C X
B X
A Y
B Y
C Y
A Z
B Z
C Y
C Z
B X
A Z
A X
B X
C Y
B Z
A Z
B Y
A Z
B X
A Z
B X
A Z
C X
C Y
C Z
B X
C Z
C Y
A Z
C X
C Z
A Z
C Y
A Y
C Y
C Y
B Y
A Z
A Z
A Y
A Z
C Z
B X
A Y
B X
B Y
B X
A Z
C Z
C Z
C Y
B X
C Z
A X
A Z
A Z
A Y
A Z
A Z
A Z
A Z
B Z
B X
B X
C Y
C Z
C Z
A Y
B X
C Z
C X
C Z
B Y
A Z
B X
B Y
B X
A Z
B X
B X
A Z
A Z
C X
B X
C Z
C X
A Z
A X
C Z
A Z
A Z
C Z
B Z
C Z
B X
A Z
A Z
C Z
A Y
A Z
A Z
C Y
A Z
B X
B Y
A Z
A Y
A X
B X
A Z
A Z
C Y
C Y
A Z
C X
A Z
A Y
A Z
B Y
A Z
A Y
B X
C Z
A Z
B X
A Z
A Z
B X
A Z
A Z
B X
A Z
C Y
A Z
C Z
C Y
B Y
B X
A Z
B Y
A Z
A Z
B X
A Z
A Z
B X
C Z
A Z
C Z
B X
B X
B Y
A Y
C Y
B X
A Z
C Z
A Z
A Z
A Z
B X
A Z
B X
A Z
A Z
A Z
C Z
A X
B X
B Z
A Z
A Z
C Z
A Z
A Z
A Z
B Y
A Y
C Z
B X
B X
C Y
A Y
A Z
C X
B Z
A Z
A Z
C Z
A Z
A Y
B Y
C Z
B X
A Z
A Z
A Z
C Z
A Z
A Y
B X
C Y
A Z
A Z
A Z
C X
B X
A Z
A Z
C Z
B X
A Z
A Z
A Z
A Z
A Z
A Z
C Y
A Z
B X
A Y
C Y
A Z
A Z
B X
A Z
B Y
A Y
B X
A X
A Z
C Z
C Z
C Y
A Z
B Y
A Z
C X
A Z
A Z
B X
A Z
A Z
B Y
A Y
A Z
A Z
B X
C Y
B X
B Y
C Y
C X
A Z
A Z
B Y
A Z
B Y
C Y
C Y
A Z
C Y
A Z
C Z
A Z
B X
A Z
A Z
A X
A Z
A Z
A Z
A Z
B Z
C X
B Y
A Z
C Z
A Z
A Z
A Z
C Z
B X
A Z
B X
C Y
C Z
A Z
A Z
C Z
B X
B X
A Z
A Z
B X
A Z
A Z
C Z
A Z
A Z
A X
C Z
C Y
A Z
A Z
A Z
A Z
C Z
A Z
A Z
B Z
A Z
C Y
A Z
A Z
B Y
A Z
A Z
B X
A Z
B X
A Z
A Z
C Y
A Y
C Y
B Z
B X
B Y
A Z
A Z
C Y
A Z
A Y
B Z
A Z
C Y
A Z
A Z
A X
A Z
B Y
B Y
A Z
A Z
A Z
C Z
C Z
A Y
C Y
B X
A Y
B X
B Y
C X
C Y
C Y
A Z
C Z
A Z
A Z
A Z
B X
A Z
A Z
A Z
A Z
A Y
B X
A Z
A Z
B X
A Z
A Z
A Z
A Z
A X
C Y
B X
A Z
A Y
C Y
C Y
A X
A Z
C X
C Z
A Z
C X
A Z
A Z
B Y
A Z
A Z
A Z
B X
A Z
A Z
B X
B X
A Z
A Z
C Z
C Z
A Z
C Z
B X
A Z
A Z
B X
C Z
C Z
C Y
C Z
A Z
B X
A X
C Z
A X
C Z
A Z
A Z
A Z
A Z
A Z
B X
A Z
B X
C Y
A Z
A Z
A Z
C Z
A Y
A Y
B Y
A Z
A Z
C Y
C Z
B X
B X
A X
C Z
B X
A Z
A Z
A Z
B Z
A Z
C Y
B X
A Z
A Z
A Y
B Y
C Z
C Z
A Z
A Z
A Z
B Y
A Z
C Y
B X
B Z
C X
B X
C Y
A X
C Z
A Z
B X
C X
A Y
C X
A Z
B X
B X
A Z
A Z
C Z
B X
B Z
C Y
C Z
A Z
B Y
A Z
A Z
B X
C Y
A Z
C Z
A Z
B Z
C Z
C Z
A Z
C Y
A Z
A Z
A Z
C Z
C X
B Y
C Y
A Z
C Y
C Y
C X
C Y
A Z
C Y
C Y
C X
C X
A Z
B X
A Z
C Y
A Z
B X
B X
B X
B X
B X
B Y
A Z
A Z
C Z
A Z
A Z
A Z
C Z
C Z
C Z
A Z
A Z
A Y
A Z
A Z
A Y
A X
C Z
A Z
A Z
C Z
B X
C Z
B Y
C Z
A Y
A Z
C Y
B X
A Z
C Y
A Z
C Z
C Y
B X
A Z
A Z
A Z
A Z
A Z
C X
C Z
A Z
A Z
A Z
C Z
A Z
B X
A Z
A X
A Z
B X
A Z
C Z
A Z
A Y
B X
B Z
A Z
B X
A Z
A Z
B Y
A Z
A Z
C Y
B Y
C X
A Z
A Z
A Z
C Z
A Z
A Z
A Z
C Z
A Z
C Y
B X
A Z
A Z
C X
A Z
C Z
A Z
B Y
A Z
A Y
C Z
C Z
A Y
A Y
A Z
A X
A Z
A Z
B X
A Z
A Z
B X
C Z
A Z
A Y
B X
A Z
A Z
C Z
A Z
A Z
B X
B Z
A Z
A X
B Y
A Z
B X
A Z
C Z
B X
C Y
A Z
B X
A Z
A Z
A Z
B Z
A Z
C Z
A Z
C Z
B X
A Z
B Z
A Z
C Z
C Z
B Y
C Z
A Z
A Z
C Y
A Z
A Z
B X
B Y
C Z
A Z
C Z
A Z
C Z
A Z
B X
A X
B Y
A Z
C Z
A Z
C Z
C Y
B X
C Z
C Z
B Y
B X
C Z
B X
C Y
A Z
C Y
C Y
A Z
B X
A Z
C X
C Z
B Y
C Z
B Z
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Z
C Z
A Z
B Y
C Y
C X
C Y
B Y
B X
A Z
C Z
B X
B Y
A Z
B Y
A Z
A Y
B X
A Z
B X
A Z
C Z
A Z
A Z
A Z
C X
B Y
C Z
C Z
A X
C Z
A Z
C Z
B Y
A Z
B Y
A Z
A Z
A Z
B Z
C Z
A Z
A Z
A Z
A Z
A Z
A Y
A Z
C Z
A Z
C X
A Z
A Z
A Z
C Z
A Y
A Z
A Z
B Z
A Z
A Z
A Z
C Z
C Z
A Y
A Z
A X
C Y
C Y
B Z
A Y
C Z
A Z
C Z
C Z
A Z
A X
A Z
B Y
C Z
B Y
A Z
B X
A Z
A Y
A Z
A Z
A Z
C Z
A Z
A Z
A Z
C Z
A Z
C Z
C Z
C Y
A Z
B X
A Z
A Z
A Z
A Z
A Z
A Z
C X
C Z
C X
A Z
A Z
A Z
A Z
A Z
A Z
C Z
B Y
B X
A Z
C Z
B Z
A Z
C Y
A Z
C Z
A Z
C Z
A Z
A Z
A Z
C Z
A Z
C Y
A Z
A Z
A Z
A Z
A Z
C Z
C Y
A Z
C X
A Z
C X
C Z
C Z
A Z
A Z
B Y
B X
A Z
B X
A Z
A Z
A Z
C Z
B Z
A Z
A Y
B Y
A Z
C Z
B X
C X
C Y
C Y
C Z
C X
B X
A Z
B X
A Z
C Z
A Z
A Y
A Z
B X
A Y
A Z
A Y
C Y
A Y
A Z
A Z
B X
C X
A Z
A Z
A Z
A Z
A Z
A Z
A Y
B X
A Z
A Z
B Y
B X
A Z
A Z
B X
A Z
C Y
C Y
B Y
A Z
A Z
A Y
A Z
A Z
A Y
C Z
C Y
C Z
C X
C Z
C Y
A Z
A Z
C Z
B X
A Z
C Z
A Z
C Z
C X
B Y
C X
B X
C Z
B X
C Z
A Z
A Y
B Y
A Z
A Z
C X
C Y
A Z
B X
A Z
A Z
C Y
C Z
B X
B X
A Z
C X
A Z
B X
C Y
A Z
A Y
B X
C Y
B X
A X
A Z
A Z
A Z
C Z
B Y
C Z
B Y
A Z
A Z
C Z
B X
A Z
A Z
A Z
A Z
C Y
B X
A Z
C X
A Z
C Z
B Z
A Z
A Z
A Z
B Z
A Y
A Z
A Z
C Z
B Z
A X
B X
A Z
A Z
A Z
A Z
A Z
A X
C Z
A Z
C Z
B X
B X
C Y
B X
A Z
A Z
C Y
C Z
B X
C Y
A Y
B X
B X
C X
A Z
A Z
C Z
A Z
C Z
C Z
B X
A Z
B X
A Z
A Z
B Y
B Y
A Z
A Z
C Z
A Z
A Z
B X
A Z
C Z
C Z
B X
C Y
A Z
A X
B X
B X
B Y
B Y
A Z
C Z
A Z
C Z
A Z
C Y
B X
A Z
A Z
C Z
B X
A Z
C Y
A Z
A Z
A Z
B X
A Z
A Y
C Y
C Z
A Z
A Z
B X
C Y
A Z
C X
A Z
B X
A Z
A Z
B Y
B X
C Z
A Z
B X
A Y
A Z
B Z
A Z
C Y
B Y
C Z
C X
B X
A X
B X
B Z
B X
B Y
B X
C Y
B X
A Y
B Z
B X
C X
B X
A Z
A Z
B X
B X
A Z
A Z
C Y
B Y
A Z
A Z
A Z
C Z
A Z
B X
A Z
B X
A Z
A Z
A Z
A Z
C Y
C X
A Z
A Z
A Z
A Z
B Y
A Z
A Z
C Z
C Z
B X
A Z
A Z
B X
A Z
B X
C Y
B X
C Z
A Z
C Z
C Z
A Z
A Z
A Z
A Z
A Z
C X
C Z
B X
B X
B X
A Z
A Z
C Z
B X
A Z
C X
A Z
C Z
A Z
A Z
C Z
A Z
A X
B X
A Z
A Z
A X
A Z
B Y
A Z
A Z
A Z
C Y
C Y
A Z
C Y
C X
A Z
B Y
A Z
A Z
B Y
A Z
A Z
A Z
C Y
B X
A Z
A Z
A Z
A X
A Z
A Y
A Y
A Z
C Z
B Y
C Y
B X
B X
B X
A Z
A Z
A Z
C Y
A Z
B X
A Z
A Z
C Z
B X
A Z
A Z
C Z
A Z
C Y
A Z
B X
C Z
C Y
A Z
C X
A Y
B Z
C Z
C Y
A Z
A Z
A Z
A Y
A Y
C Y
B X
C Z
B X
C Y
B X
B X
A Z
A Z
C Z
A Z
B X
A Z
B X
C Y
C Z
A X
B X
B X
C Z
C Z
C Z
C Z
C Z
A X
A Z
B X
A Z
B X
A Z
A Z
A Z
B X
B Y
C Z
C Y
A Z
C Z
B X
C Z
A Z
C Z
A Z
A Z
A Z
B X
B Z
A X
B Y
C Z
A Z
A X
A Y
A Z
C Y
A Z
C Z
A Z
A Z
A X
A Z
A Y
B Z
A Z
A Z
B X
B Y
A Z
C Z
A Z
A Z
C Z
A Z
A Z
C Y
B X
B X
A Z
C Y
B Z
A Z
B X
B X
B X
B Y
C Z
B Z
A X
B X
A Y
A Z
B X
B X
A Z
B X
A Z
C Z
A Z
C Z
C Y
B X
B X
C X
A Z
A X
A Z
C Y
C Z
C Y
C Z
C Y
C Y
B X
B Y
A Z
C X
C Z
B X
C Z
C Z
B X
A Z
A Z
A Y
A Z
A Z
C Y
A Z
B X
A Z
A Z
C Y
A Z
A Z
B X
A Z
A Z
B Z
A Z
A Z
A Z
A Z
A Z
C Z
A Y
A Z
C Z
C Z
C Z
A Z
B X
B Y
A Z
C X
A Y
A Y
C Y
C Y
A Z
C Y
B X
C X
B X
C Y
A Z
A Y
B X
B X
A Z
A Z
A Z
A X
A Z
B X
B Y
A Y
C Z
B Y
A X
A Z
A X
A Z
A X
A Y
C Y
C Z
A Z
A Z
A Z
C Y
A Z
A X
A Z
A X
A Z
A Z
B X
C X
C Y
C Z
B X
A X
C Z
C Z
C X
A Z
C Z
C Y
A Z
C Z
C Z
B X
A Z
B Y
B X
B X
C Z
A Z
A Z
B X
B X
A Z
C Z
B X
A Y
B Z
C X
A Z
C Y
A Z
A Z
B X
C Z
C Y
A Z
B X
B Y
A Z
B X
B Z
C X
A Z
C Y
C Z
B X
C X
C Y
A X
C X
C Y
B Y
A Z
C Y
C Z
A Z
A Z
A Y
A Z
C Y
C X
B X
C Y
A Z
B Y
A Z
B X
A Z
C X
A Z
C Z
B Y
B Y
B Y
C Y
A Z
A Y
C Z
C Y
B Y
A Z
B Y
B X
A Z
B Z
A Z
A Z
A Z
C Y
A Z
B X
A Z
C Z
B X
B X
C Z
A Z
C Z
B Y
C Y
C Z
A Z
A Z
A Z
A Z
A Z
C Z
A Z
C Y
A Z
B Y
A Z
C X
A Z
A Z
C Y
A Z
B X
A Z
A Z
B Y
A Y
C X
A Y
A Z
A Z
A Z
B X
A Z
B X
C Z
A Z
B X
C Y
C Z
A Z
A Z
C Z
A Z
A Z
A X
B X
B X
A Z
B X
C Y
A Y
A Z
A Z
C X
A Z
A Z
B X
A Z
A Z
A Z
A Y
B X
A Z
B X
B X
B X
B X
A Y
B X
A Z
A Z
B X
C Y
B X
C Z
B X
A Z
C X
A Z
B Y
C Z
B X
A Z
A Z
C Y
C Y
A Z
A Z
C Z
A Y
A Z
C X
C Z
A Z
A Z
B X
A Z
B X
A Y
B Z
B X
A Z
A X
B X
A Z
A Z
A Y
C Z
A Z
A Z
C Z
C Z
A X
A Z
C Y
A Z
B X
A Z
A Z
A Y
C Y
B X
C Z
A Z
C Y
B Y
A Z
B Y
C Z
A Z
A X
B X
B X
A Z
A X
A Z
A Z
A Z
A Z
B Z
A Y
A Z
A X
C Y
A Z
B X
B Y
B X
C Z
A Z
A Z
B X
A Z
C Z
A Z
B X
C Y
C Z
A Z
B Z
C Z
B X
C Y
A Z
C Z
B X
B X
A Y
A Z
B Z
B X
C Z
A Z
C Y
B Y
A Z
B Y
A Z
C Z
B X
B X
B X
C Z
A X
B Y
B Y
A Z
A Z
A Z
A Z
A Z
B X
A Z
A Z
B X
C Z
A Z
C Y
C Z
A Z
A X
A Z
A Z
A Z
B X
B Y
B X
A Z
A Z
C Z
A Z
C Z
A Z
A Z
B X
A Z
A Z
C Y
A Z
B X
A Z
A Z
B X
A Z
C Z
A Z
B X
A Z
A Z
A Z
C Z
B Y
A Z
B X
C X
A Z
B X
A Z
C Y
A Z
A Y
A Z
B Z
B X
C Z
A Z
C Z
C Y
B Y
B X
B Y
C Y
C Y
A Z
C Y
A X
A Z
B Y
A Z
B X
A Y
C Y
B X
C Y
B X
A Z
A X
B Y
B X
C Z
A Z
A Z
A Z
A Z
A Z
C Z
C Z
A Z
A Y
B X
B X
C Z
A Z
A Z
C X
B Z
C Z
B X
A Z
A Y
A Z
A Z
A Z
A Z
A Z
A Z
B Z
B X
A Z
B X
C Y
C Z
A Z
B X
B X
A Z
C X
A Z
B Y
A Z
C Y
B X
A Y
B Y
C Y
B X
B X
B Y
C Y
B X
A Z
C X
A Z
B X
A Z
A Y
A Z
A X
C X
C Y
A Z
A Z
C Y
A Z
A Z
A X
C Z
C Y
A Z
A Z
B X
B X
C Z
B X
A Z
C Y
B X
B X
C Z
A X
A Z
B Z
C Z
C Y
A Z
C Z
C Z
B Y
C Y
B Y
C Z
A Z
C Z
B X
A Z
B Y
B Y
C Y
C Y
A Z
C Z
C Z
A Z
A Z
C X
A Z
A Z
C X
A Z
A Z
A Y
A X
C X
A Z
A Z
A Z
C Z
A Z
A Z
A X
A X
B Y
A X
A Z
A X
B X
B X
A Z
C Y
A Z
C Y
C Y
B X
B X
A Z
B Z
B X
C X
B X
A Z
A Z
A Z
B X
C Y
C Z
A Z
B Y
C Y
C X
A Z
A Z
A Z
A Z
A X
C Z
A Z
B X
A Z
A Z
C Z
C X
C Z
A Z
C Y
B Y
A Z
C Z
B X
B Z
A Z
A Z
A Y
C Y
C Z
C Z
A Z
A Z
C Z
B X
A Z
A Z
A Z
B X
A Z
B X
B X
A Z
C Y
A Z
A Z
A Z
C Z
A Z
C Y
B X
A Z
C Z
A Z
C Z
A X
A Z
A Z
A Z
A Z
A Z
A Z
C Z
A Z
A Z
A Z
B X
C Y
B Z
A Z
C X
A Z
C Z
C Z
C Y
C Y
B X
A Z
C Z
A Z
A Z
A Z
A Z
A Z
A Z
A Y
A Z
A Z
A Z
C Y
B Y
C Z
C Z
A Z
A Z
A Z
A Y
C Z
A Z
A Y
A Z
A Z
A Z
B X
B X
C Y
B X
A Z
A Z
A X
C Z
C Y
A Z
C Y
A Z
A Z
A Z
C X
B X
A Z
C X
C Y
A Z
A Z
A Z
A Z
A Z
A Z
C Z
B X
C X
C Z
B Y
B Z
B Z
C Y
A Z
B X
B X
A Z
A Z
A Z
B Z
B Z
A Z
C Z
A Y
C X
C Y
A X
C Y
A Z
C X
A Z
B X
C Z
B X
B Z
A Z
A X
A Z
B X
C Y
B Y
A Z
C Z
A Y
A Z
C Y
A Z
C Y
B X
A Z
A Z
A Z
A Z
B Y
A X
A Z
C Z
A Z
C Z
B X
C Z
A Z
B Y
A Z
C Y
C Y
C Z
A Z
A Z
A Y
B X
A Z
A Z
C X
B X
C X
A Y
A Z
A X
B X
A Z
B Y
C Z
C Z
C Y
A Z
A Y
A Z
A Z
B Z
C Y
A Z
A Z
B Y
"""

enum RPS {
    case rock
    case paper
    case scissors

    static func parse(symbol: String) -> RPS {
        switch symbol {
        case "A":
            return .rock
        case "X":
            return .rock
        case "B":
            return .paper
        case "Y":
            return .paper
        case "C":
            return .scissors
        case "Z":
            return .scissors
        default:
            fatalError("Unknown symbol \(symbol)")
        }
    }

    var score: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissors: return 3
        }
    }
}

enum Result {
    case win
    case loss
    case draw

    var score: Int {
        switch self {
        case .win: return 6
        case .loss: return 0
        case .draw: return 3
        }
    }
}

struct Round {
    let opponent: RPS
    let response: RPS

    var result: Result {
        switch (response, opponent) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
            (.scissors, .paper),
            (.paper, .rock):
            return .win
        case (.scissors, .rock),
            (.rock, .paper),
            (.paper, .scissors):
            return .loss
        }
    }

    var score: Int {
        return result.score + response.score
    }
}

func parse(_ input: String) -> [Round] {
    let lines = input.components(separatedBy: "\n")
    return lines.map { line in
        let components = line.components(separatedBy: " ")
        return Round(
            opponent: .parse(symbol: components[0]),
            response: .parse(symbol: components[1])
        )
    }
}

print(parse("""
A Y
B X
C Z
""").map { $0.score }.reduce(0) { $0 + $1 }
)

print(parse(input).map { $0.score }.reduce(0) { $0 + $1 }
)