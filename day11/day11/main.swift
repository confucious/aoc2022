//
//  main.swift
//  day11
//
//  Created by Jerry Hsu on 12/12/22.
//

import Foundation

struct Monkey {
    let index: Int
    var items: [Int]
    let operation: (Int) -> Int
    let test: (Int) -> Bool
    let trueTarget: Int
    let falseTarget: Int
    var totalInspections = 0
}

struct State {
    let roundNumber: Int
    let monkeys: [Monkey]

    func step() -> State {
        var newMonkeys = monkeys
        for index in 0 ..< monkeys.count {
            let monkey = newMonkeys[index]
            newMonkeys[index].totalInspections += monkey.items.count
            monkey.items.forEach { item in
                let newItem = monkey.operation(item) / 3
                let target = monkey.test(newItem) ? monkey.trueTarget : monkey.falseTarget
                newMonkeys[target].items.append(newItem)
            }
            newMonkeys[index].items = []
        }
        return State(roundNumber: roundNumber + 1, monkeys: newMonkeys)
    }
}

let sampleState = State(
    roundNumber: 0,
    monkeys: [
        Monkey(
            index: 0,
            items: [79, 98],
            operation: { $0 * 19 },
            test: { $0 % 23 == 0},
            trueTarget: 2,
            falseTarget: 3
        ),
        Monkey(
            index: 1,
            items: [54, 65, 75, 74],
            operation: { $0 + 6 },
            test: { $0 % 19 == 0},
            trueTarget: 2,
            falseTarget: 0
        ),
        Monkey(
            index: 0,
            items: [79, 60, 97],
            operation: { $0 * $0 },
            test: { $0 % 13 == 0},
            trueTarget: 1,
            falseTarget: 3
        ),
        Monkey(
            index: 0,
            items: [74],
            operation: { $0 + 3 },
            test: { $0 % 17 == 0},
            trueTarget: 0,
            falseTarget: 1
        )
    ]
)

let inputState  = State(
    roundNumber: 0,
    monkeys: [
        Monkey(
            index: 0,
            items: [66, 71, 94],
            operation: { $0 * 5 },
            test: { $0 % 3 == 0 },
            trueTarget: 7,
            falseTarget: 4
        ),
        Monkey(
            index: 1,
            items: [70],
            operation: { $0 + 6 },
            test: { $0 % 17 == 0 },
            trueTarget: 3,
            falseTarget: 0
        ),
        Monkey(
            index: 2,
            items: [62, 68, 56, 65, 94, 78],
            operation: { $0 + 5 },
            test: { $0 % 2 == 0 },
            trueTarget: 3,
            falseTarget: 1
        ),
        Monkey(
            index: 3,
            items: [89, 94, 94, 67],
            operation: { $0 + 2 },
            test: { $0 % 19 == 0 },
            trueTarget: 7,
            falseTarget: 0
        ),
        Monkey(
            index: 4,
            items: [71, 61, 73, 65, 98, 98, 63],
            operation: { $0 * 7 },
            test: { $0 % 11 == 0 },
            trueTarget: 5,
            falseTarget: 6
        ),
        Monkey(
            index: 5,
            items: [55, 62, 68, 61, 60],
            operation: { $0 + 7 },
            test: { $0 % 5 == 0 },
            trueTarget: 2,
            falseTarget: 1
        ),
        Monkey(
            index: 6,
            items: [93, 91, 69, 64, 72, 89, 50, 71],
            operation: { $0 + 1 },
            test: { $0 % 13 == 0 },
            trueTarget: 5,
            falseTarget: 2
        ),
        Monkey(
            index: 7,
            items: [76, 50],
            operation: { $0 * $0 },
            test: { $0 % 7 == 0 },
            trueTarget: 4,
            falseTarget: 6
        )
    ]
)

var states = [inputState]
(0 ..< 20).forEach { _ in states.append(states.last!.step()) }
states.forEach { state in
    print("\(state.roundNumber):")
    state.monkeys.forEach { monkey in
        print("Monkey \(monkey.index): \(monkey.items) \(monkey.totalInspections)")
    }
}
