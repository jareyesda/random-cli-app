
import ArgumentParser

struct Random: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Random number generation, from 1...<input value>",
                                                    subcommands:[ Number.self,
                                                                  Pick.self])
}

extension Random {
    
    struct Pick: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Pick random elements from your input")
        
        @Option(help: "The number of elements to choose")
        var count: Int
        
        @Argument()
        var elements: [String]
        
        func validate() throws {
            guard !elements.isEmpty else {
                throw ValidationError("Must provide at least one element.")
            }
        }
        
        func run() throws {
            let picks = elements.shuffled().prefix(count)
            print(picks.joined(separator: "\n"))
        }
    }
    
    // > random pick --count 3 A B C D E F G H I
    
    struct Number: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Choose a high value")
        
        @Argument()
        var highValue: Int
        
        func validate() throws {
            guard highValue >= 1 else {
                throw ValidationError("Value shold be at least 1")
            }
        }
        
        func run() throws {
            print(Int.random(in: 1...highValue))
        }
    }
    
}


Random.main()
