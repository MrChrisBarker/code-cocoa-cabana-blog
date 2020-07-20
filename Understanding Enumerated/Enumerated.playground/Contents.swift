// Understanding 'enumerated()' in Swift
// Chris Barker - @MrChrisBarker
// Code, Cocoa, Cabana
// www.cocoa-cabana.net

import UIKit


// Basic 'enumerated()' example;
print("------")
print("Basic 'enumerated()' example;")
print("------")
for (index, letter) in "CocoaCabana".enumerated() {
    print("Index: \(index), Letter:\(letter)")
}

//Old Skool approach;
print("------")
print("Old Skool approach;")
print("------")
var c = 0
for (letter) in "CocoaCabana" {
    print("Index: \(c), Letter:\(letter)")
    c+=1
}

// Roman Numerals Kata result;
print("------")
print("------")
let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
let equivalentValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

extension Int {
    func toRoman() -> String {
        var originalNumber = self
        var numeralString = String()
        
        while originalNumber > 0 {
            for (index, equivalentValue) in equivalentValues.enumerated() where originalNumber - equivalentValue >= 0 {
                originalNumber -= equivalentValue
                numeralString += romanValues[index]
                break
            }
        }
        
        return numeralString
    }
}

print(1981.toRoman())
