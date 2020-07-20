import UIKit

// Resources:
// https://www.romannumerals.org/converter
// https://en.wikipedia.org/wiki/Roman_numerals

// Task:
// Write an extension that converts an Integer to Roman Numeral (as String)
// e.g. 1981 becomes MCMLXXXI

// Good Luck, but more importantly - have fun!

let exampleDate = 1981.toRoman() // MCMLXXXI
print(exampleDate)

let unitTest = (1981.toRoman() == "MCMLXXXI")
print(unitTest)

extension Int {
    
    func toRoman() -> String {
        // TODO: Your logic here 🤪
        return "MCMLXXXI"
    }
    
}
