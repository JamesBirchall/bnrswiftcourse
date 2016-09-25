//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int, Int) // to capture range of this value
    case Plus(Int)
    case Minus(Int)
}

class Lexer {
    enum error: Error {
        // now throws character and position in input
        case InvalidCharacter(Character, Int)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    var startingIndex = 0
    
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
                // work out the index value range
                tokens.append(.Number(value, startingIndex))
            case "+":
                tokens.append(.Plus(startingIndex))
                advance()
            case "-":
                tokens.append(.Minus(startingIndex))
                advance()
            case " ":
                // nothing to do but advance
                advance()
            default:
                throw error.InvalidCharacter(nextCharacter, input.distance(from: input.startIndex, to: input.index(of: input[position])!))
            }
            
            startingIndex = startingIndex + 1
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
        case InvalidToken(Token, Int)
        // case InvalidToken(Token)
    }
    
    var tokens: [Token]
    var position = 0
    let input: String.CharacterView
    
    init(tokens: [Token], input: String) {
        self.tokens = tokens
        self.input = input.characters
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
        case .Number(let value, let startingIndex):
            return value
        case .Plus(let startingIndex), .Minus(let startingIndex):
            throw parseErrors.InvalidToken(token, startingIndex)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()

        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Number(let value, let startingPosition):
                throw parseErrors.InvalidToken(token, startingPosition+1)
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
        
        let parser = Parser(tokens: tokens, input: input)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.error.InvalidCharacter(let character, let position) {
        print("Input contained an invalid character at position \(position): \(character)")
    } catch Parser.parseErrors.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.parseErrors.InvalidToken(let token, let position) {
        print("Invalid token found during parsing at index \(position): \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

//evaluate(input: "1 + 3 * 7a + 8")

evaluate(input: "10 + 3 3 + 7")

// so in order to get actual position, error was at index 4, with number 3
// in order to get actual placement, what should I be doing?...