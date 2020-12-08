//  Author Alexander Heß
//  main.swift
//  easy-aliaser
//
//  Created by Alexander Heß on 04.12.20.

import Foundation

for argument in CommandLine.arguments {
    switch argument {
    case "arg1":
        print("first argument");
    case "arg2":
        print("second argument");
    default:
        print("an argument");
    }
}


func readFile(path: String) -> Int {
    errno = 0
    if freopen(path, "r", stdin) == nil {
        perror(path)
        return 1
    }
    while let line = readLine() {
        print(line)
        // do something with lines
    }
    return 0
}



readFile(path: "/Users/alexanderhess/.zshrc")

