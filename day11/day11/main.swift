//
//  main.swift
//  day11
//
//  Created by Jerry Hsu on 12/12/22.
//

import Foundation
import BigInt

struct Monkey {
    let index: Int
    var items: [Item]
    let operation: (Item) -> Item
    let test: Int
    let trueTarget: Int
    let falseTarget: Int
    var totalInspections = 0
}

struct State {
    let roundNumber: Int
    let monkeys: [Monkey]

//    func step() -> State {
//        var newMonkeys = monkeys
//        for index in 0 ..< monkeys.count {
//            let monkey = newMonkeys[index]
//            newMonkeys[index].totalInspections += monkey.items.count
//            monkey.items.forEach { item in
//                let newItem = monkey.operation(item) / 3
//                let target = monkey.test(newItem) ? monkey.trueTarget : monkey.falseTarget
//                newMonkeys[target].items.append(newItem)
//            }
//            newMonkeys[index].items = []
//        }
//        return State(roundNumber: roundNumber + 1, monkeys: newMonkeys)
//    }

    func step2() -> State {
        var newMonkeys = monkeys
        for index in 0 ..< monkeys.count {
            let monkey = newMonkeys[index]
            newMonkeys[index].totalInspections += monkey.items.count
            monkey.items.forEach { item in
                let newItem = monkey.operation(item)
                let target = newItem.isDivisible(by: monkey.test) ? monkey.trueTarget : monkey.falseTarget
                newMonkeys[target].items.append(newItem)
            }
            newMonkeys[index].items = []
        }
        return State(roundNumber: roundNumber + 1, monkeys: newMonkeys)
    }
}

struct Item: ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = Int

    var modulo: [Int:Int]
    init(integerLiteral value: Int) {
        let moduloPairs = [2,3,5,7,11,13,17,19,23]
//        let moduloPairs = [13,17,19,23]
            .map { ($0, value % $0) }
        modulo = Dictionary(uniqueKeysWithValues: moduloPairs)
    }

    func isDivisible(by value: Int) -> Bool {
        guard let remainder = modulo[value] else {
            fatalError("\(value) is not being checked")
        }
        return remainder == 0
    }

    func multiplied(by value: Int) -> Item {
        var newItem = self
        newItem.modulo = Dictionary(
            uniqueKeysWithValues: modulo.map { (divisor, remainder) in
                return (divisor, (remainder * (value % divisor)) % divisor)
            }
        )
        return newItem
    }

    func added(with value: Int) -> Item {
        var newItem = self
        newItem.modulo = Dictionary(
            uniqueKeysWithValues: modulo.map { (divisor, remainder) in
                return (divisor, (remainder + value) % divisor)
            }
        )
        return newItem
    }

    func squared() -> Item {
        var newItem = self
        newItem.modulo = Dictionary(
            uniqueKeysWithValues: modulo.map { (divisor, remainder) in
                return (divisor, (remainder * remainder) % divisor)
            }
        )
        return newItem
    }
}

let sampleState = State(
    roundNumber: 0,
    monkeys: [
        Monkey(
            index: 0,
            items: [79, 98],
            operation: { $0.multiplied(by: 19) },
            test: 23,
            trueTarget: 2,
            falseTarget: 3
        ),
        Monkey(
            index: 1,
            items: [54, 65, 75, 74],
            operation: { $0.added(with: 6) },
            test: 19,
            trueTarget: 2,
            falseTarget: 0
        ),
        Monkey(
            index: 2,
            items: [79, 60, 97],
            operation: { $0.squared() },
            test: 13,
            trueTarget: 1,
            falseTarget: 3
        ),
        Monkey(
            index: 3,
            items: [74],
            operation: { $0.added(with: 3) },
            test: 17,
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
            operation: { $0.multiplied(by: 5) },
            test: 3,
            trueTarget: 7,
            falseTarget: 4
        ),
        Monkey(
            index: 1,
            items: [70],
            operation: { $0.added(with: 6) },
            test: 17,
            trueTarget: 3,
            falseTarget: 0
        ),
        Monkey(
            index: 2,
            items: [62, 68, 56, 65, 94, 78],
            operation: { $0.added(with: 5) },
            test: 2,
            trueTarget: 3,
            falseTarget: 1
        ),
        Monkey(
            index: 3,
            items: [89, 94, 94, 67],
            operation: { $0.added(with: 2) },
            test: 19,
            trueTarget: 7,
            falseTarget: 0
        ),
        Monkey(
            index: 4,
            items: [71, 61, 73, 65, 98, 98, 63],
            operation: { $0.multiplied(by: 7) },
            test: 11,
            trueTarget: 5,
            falseTarget: 6
        ),
        Monkey(
            index: 5,
            items: [55, 62, 68, 61, 60],
            operation: { $0.added(with: 7) },
            test: 5,
            trueTarget: 2,
            falseTarget: 1
        ),
        Monkey(
            index: 6,
            items: [93, 91, 69, 64, 72, 89, 50, 71],
            operation: { $0.added(with: 1) },
            test: 13,
            trueTarget: 5,
            falseTarget: 2
        ),
        Monkey(
            index: 7,
            items: [76, 50],
            operation: { $0.squared() },
            test: 7,
            trueTarget: 4,
            falseTarget: 6
        )
    ]
)

var states = [inputState]
(0 ..< 10000).forEach { _ in states.append(states.last!.step2()) }
states.forEach { state in
    print("\(state.roundNumber):")
    state.monkeys.forEach { monkey in
//        print("Monkey \(monkey.index): \(monkey.items) \(monkey.totalInspections)")
        print("Monkey \(monkey.index): \(monkey.totalInspections)")
    }
}
