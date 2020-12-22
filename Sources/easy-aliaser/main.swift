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
        subcommands: [
            readAliases.self,
            NewAlias.self
        ])
}
extension Alias {
    struct readAliases: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Reads All The Self Defined Aliases From Your .zshrc File")
        
        func run() {

            print("These are your Aliases");
            readFile(path: "/Users/alexanderhess/testAlias")
           }
            func readFile(path: String) -> Int {
                errno = 0
                if freopen(path, "r", stdin) == nil {
                    perror(path)
                    return 1
                }
                while let line = readLine() {
                    if(line.starts(with: "alias")){
                        print(line.dropFirst(6));
                    }
                }
                return 0
            }
    }
    struct NewAlias : ParsableCommand {
        @Argument(help: "String which is a shortcut for a command") var alias: String
        @Argument(help: "The command itself which will be shortcuted ") var command: String
        
        static let configuration = CommandConfiguration(
            abstract: "Add a new Alias parameters are <alias> <command>")
        
        func run() {
            let fileName = URL(fileURLWithPath: "/Users/alexanderhess/testAlias");
            // This represents the new alias which will be inserted inside the zsh file
            // now I have to inside the alias at the end of the file
                let myAlias = "\n" + "alias " + alias + "=\"" + command + "\"";
                
                    
                    if let fileUpdater = try? FileHandle(forUpdating: fileName) {

                        // Function which when called will cause all updates to start from end of the file
                        fileUpdater.seekToEndOfFile()

                        // Which lets the caller move editing to any position within the file by supplying an offset
                        fileUpdater.write(myAlias.data(using: .utf8)!)

                        // Once we convert our new content to data and write it, we close the file and that’s it!
                        fileUpdater.closeFile()
                    }
                }
            }
        }
    



    Alias.main();





