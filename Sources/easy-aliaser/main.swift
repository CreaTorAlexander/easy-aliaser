//  Author Alexander Heß
//  main.swift
//  easy-aliaser
//
//  Created by Alexander Heß on 04.12.20.

import Foundation
import ArgumentParser

struct Alias: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Make Editing Your .zshrc Much Easier",
        subcommands: [readAliases.self])
}
extension Alias {
    struct readAliases: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Reads All The Aliases In Your .zshrc File")
        
        func run() {

            print("These are your Aliases");
            readFile(path: "/Users/alexanderhess/.zshrc")
           }
            func readFile(path: String) -> Int {
                errno = 0
                if freopen(path, "r", stdin) == nil {
                    perror(path)
                    return 1
                }
                while let line = readLine() {
                    if(line.starts(with: "# alias")){
                        print(line.dropFirst(8));
                    }
                }
                return 0
            }
    }
}
Alias.main();




