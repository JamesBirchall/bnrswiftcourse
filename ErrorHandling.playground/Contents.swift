//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int, Int) // to capture range of this value
    case Plus(Int)
    case Minus(Int)
    case Multiply(Int)
    case Divide(Int)
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
            case "*":
                tokens.append(.Multiply(startingIndex))
                advance()
            case "/":
                tokens.append(.Divide(startingIndex))
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
        case .Plus(let startingIndex), .Minus(let startingIndex), .Multiply(let startingIndex), .Divide(let startingIndex):
            throw parseErrors.InvalidToken(token, startingIndex)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()

        // before we get to this look we should minimise the tokens array to take out all multply valyes and replace with a + number, removing number * number
        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Number(let _, let startingPosition):
                throw parseErrors.InvalidToken(token, startingPosition+1)
            default: break
                // throw error - unknown error in this case
            }
        }
        return value
    }
    
    func parseMultiplyDivide() throws  {
        position = tokens.startIndex
        while let token = getNextToken() {
            switch token {
            case  .Multiply :
                if position > 1 {
                    position -= 2
                    var value = try getNumber()
                    position += 1
                    
                    let nextNumber = try getNumber()
                    let oldValue = value
                    value *= nextNumber
                    print("Found Multiply: \(oldValue) * \(nextNumber) = \(value)")
                    position = position - 1
                    tokens.remove(at: position)
                    position = position - 1
                    tokens.remove(at: position)
                    position = position - 1
                    tokens[position] = .Number(value, position)
                }
            case  .Divide :
                if position > 1 {
                    position -= 2
                    var value = try getNumber()
                    position = position + 1
                    
                    let nextNumber = try getNumber()
                    let oldValue = value
                    value /= nextNumber
                    print("Found Multiply: \(oldValue) / \(nextNumber) = \(value)")
                    position = position - 1
                    tokens.remove(at: position)
                    position = position - 1
                    tokens.remove(at: position)
                    position = position - 1
                    tokens[position] = .Number(value, position)
                }
            default: break
            }
        }
        
        position = 0    // reset position to allow for redos
        return
    }
}

func evaluate(input: String) {
    print("Evaulating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens, input: input)
        // gold challenge
        try parser.parseMultiplyDivide()    //parse through all * / first to reduce to +/- easily
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

//evaluate(input: "10 + 3 3 + 7")

evaluate(input: "10 * 3 + 5 * 3")
evaluate(input: "10 + 3 * 5 + 3")
evaluate(input: "10 + 3 * 5 * 3")
//evaluate(input: "10 + 3 *+ 5 * 3")

// now look at * - this then needs to also take precedence in to account
// search through tokens for * or /, if finds, take before/after and do the equation, then remove those 3 items and replace with a value, then re-run.
