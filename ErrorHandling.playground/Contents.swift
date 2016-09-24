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
        self.position = self.input.startIndex
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
                advance()
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

class Parser {
    
    enum parseErrors: Error {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    var tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }

        let positionToReturn = position
        
        position = position + 1
        
        return tokens[positionToReturn]
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw parseErrors.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus:
            throw parseErrors.InvalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()

        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Number:
                throw parseErrors.InvalidToken(token)
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
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.parseErrors.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.parseErrors.InvalidToken(let token) {
        print("Invalid token found during parsing: \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate(input: "10 + 3 + 5")
// evaluate(input: "1 + 2 + abcdefg")
