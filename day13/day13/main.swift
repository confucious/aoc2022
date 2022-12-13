//
//  main.swift
//  day13
//
//  Created by Jerry Hsu on 12/13/22.
//

import Foundation

enum Item: Equatable {
    case value(Int)
    case list([Item])
}

func parse(line: String) -> (item: Item?, remaining: String) {
    var remaining = line
    if line.first == "[" {
        remaining = String(remaining.dropFirst())
        var accum = [Item]()
        var terminated = false
        repeat {
            let result = parse(line: remaining)
            if let item = result.item {
                accum.append(item)
            }
            terminated = result.remaining.first == "]"
            remaining = String(result.remaining.dropFirst())
        } while !terminated
        return (.list(accum), remaining)
    } else if line.first == "]" {
        return (nil, remaining)
    } else {
        let index = line.firstIndex { char in
            char == "," || char == "]"
        }!
        let token = String(line[...index])
        let remaining = String(line[index...])
        let value = Int(String(token.dropLast()))!
        return (.value(value), remaining)
    }
}

func parse(_ input: String) -> [(Item, Item)] {
    return input.components(separatedBy: "\n\n")
        .map { packet in
            let lines = packet.components(separatedBy: "\n")
            return (parse(line: lines[0]).item!, parse(line: lines[1]).item!)
        }
}

enum Result {
    case inOrder
    case outOfOrder
    case equal
}

func isInOrder(_ packet: (Item, Item)) -> Result {
    switch packet {
    case let (.value(lhs), .value(rhs)):
        return lhs < rhs ? .inOrder : lhs > rhs ? .outOfOrder : .equal
    case let (.value(lhs), .list(rhs)):
        return isInOrder((.list([.value(lhs)]), .list(rhs)))
    case let (.list(lhs), .value(rhs)):
        return isInOrder((.list(lhs), .list([.value(rhs)])))
    case let (.list(lhs), .list(rhs)):
        let compare = zip(lhs, rhs).reduce(Result.equal) { partialResult, pair in
            if partialResult != .equal {
                return partialResult
            }
            return isInOrder(pair)
        }
        if compare != .equal {
            return compare
        }
        return lhs.count < rhs.count ? .inOrder : lhs.count > rhs.count ? .outOfOrder : .equal
    }
}

func parse2(_ input: String) -> [Item] {
    let extra = """

[[2]]
[[6]]
"""
    return (input + extra).components(separatedBy: "\n")
        .filter { !$0.isEmpty }
        .map { parse(line: $0).item! }
}

let packets = parse(sample)
print(packets.enumerated()
    .filter { values in
        return isInOrder(values.element) == .inOrder
    }
    .reduce(0) { partialResult, values in
        return partialResult + values.offset + 1
    })

let packets2 = parse2(input)
let sorted = packets2.sorted { a, b in
    isInOrder((a, b)) == .inOrder
}

let first = sorted.firstIndex(where: { $0 == Item.list([Item.list([Item.value(2)])])})!
let second = sorted.firstIndex(where: { $0 == Item.list([Item.list([Item.value(6)])])})!
print(first + 1, second + 1, (first + 1) * (second + 1))
