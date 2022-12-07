//
//  main.swift
//  day7
//
//  Created by Jerry Hsu on 12/7/22.
//

import Foundation

let sample = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""

class Node {
    let path: String
    let parent: Node?
    var children: [String:Node]
    let size: Int
    var isLeaf: Bool {
        children.isEmpty
    }
    var dirSize: Int {
        children.values.reduce(0) { partialResult, child in
            partialResult + (child.isLeaf ? child.size : child.dirSize)
        }
    }

    init(path: String, parent: Node?, children: [String : Node], size: Int) {
        self.path = path
        self.parent = parent
        self.children = children
        self.size = size
    }

}

func parse(_ input: String) -> Node {
    var root = Node(path: "", parent: nil, children: [:], size: 0)
    var currentNode = root
    let commands = input.components(separatedBy: "$ ")
    for command in commands {
        guard !command.isEmpty else { continue }
        switch String(command.first!) {
        case "c":
            let components = command.trimmingCharacters(in: CharacterSet(charactersIn: "\n"))
                .components(separatedBy: " ")
            let dir = components[1]
            switch dir {
            case "/":
                currentNode = root
            case "..":
                currentNode = currentNode.parent!
            default:
                let nextNode = currentNode.children[dir]
                ?? Node(
                    path: "\(currentNode.path)/\(dir)",
                    parent: currentNode,
                    children: [:],
                    size: 0)
                currentNode.children[dir] = nextNode
                currentNode = nextNode
            }
        case "l":
            let lines = command.components(separatedBy: "\n")
            for line in lines.dropFirst() {
                guard !line.isEmpty else { continue }
                let components = line.components(separatedBy: " ")
                switch components[0] {
                case "dir":
                    let dir = components[1]
                    let newNode = currentNode.children[dir]
                    ?? Node(
                        path: "\(currentNode.path)/\(dir)",
                        parent: currentNode,
                        children: [:],
                        size: 0)
                    currentNode.children[dir] = newNode
                default:
                    let size = Int(components[0])!
                    let name = components[1]
                    let newNode = Node(
                        path: "\(currentNode.path)/\(name)",
                        parent: currentNode,
                        children: [:],
                        size: size)
                    currentNode.children[name] = newNode
                }
            }
        default:
            fatalError("Unknown command")
        }
    }
    return root
}

let root = parse(sample)

func walk(_ currentNode: Node, total: Int) -> Int {
    var result = total
    if currentNode.dirSize <= 100000 {
        result += currentNode.dirSize
    }
    for child in currentNode.children.values {
        result += walk(child, total: 0)
    }
    return result
}

print(walk(root, total: 0))
print(walk(parse(input), total: 0))
