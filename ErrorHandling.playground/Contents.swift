//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
}

class Lexer {
    enum error: Error {
        case InvalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = input.startIndex
    }
    
    // returns Character optional if can find one
    func peek() -> Character? {
        
        // gaurd against hitting end of the index which retusn nil
        guard position < input.endIndex else {
            return nil
        }
        
        return input[position]  // return Character @ position in front if found
    }
    
    func advance() {
        
        assert(position < input.endIndex, "Cannot advance past the end!")
        position = input.index(after: position) // swift 3 move to next position
    }
    
    // throws errortypes or returns tokens array
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                // range 0 - 9 characters
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.Number(value))
                // start of number - need to get rest of it
            case "+":
                tokens.append(.Plus)
            case " ":
                // nothing to do but advance
                advance()
            default:
                throw error.InvalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // force unwrap as nextChar has to be valid by case
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaulating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
    } catch {
        print("An error occured: \(error)")
    }
}

//evaluate(input: "10 + 3 + 5")
//evaluate(input: "1 + 2 + abcdefg")
