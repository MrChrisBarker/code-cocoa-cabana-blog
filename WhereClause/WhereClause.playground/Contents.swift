// 'where' clause Swift
// Chris Barker - @MrChrisBarker
// Code, Cocoa, Cabana
// www.cocoa-cabana.net

import UIKit

enum Type {
    case electronic
    case houseHome
}

struct Magazine {
    var name: String
    var type: Type
}

// Collection of Magazines
var magazines = [Magazine]()
magazines.append(Magazine(name: "What Hi-Fi", type: .electronic))
magazines.append(Magazine(name: "Gardeners World", type: .houseHome))
magazines.append(Magazine(name: "Mac Format", type: .electronic))

// My specific collection
var myMagazines = [Magazine]()

// Common for Loop
for magazine in magazines where magazine.type == .electronic {
    myMagazines.append(magazine)
}
print("Number of My Magazines: \(myMagazines.count)")

// Swift Array ForEach - can't use 'where' clause
myMagazines.removeAll()
magazines.forEach { (magazine) in
    myMagazines.append(magazine)
}
print("Number of My Magazines: \(myMagazines.count)")


// Swift Array ForEach - could be extended to use a function
// where your 'where' clause logic could site
private func processSubscription(_ magazine: Magazine) {
    if magazine.type == .electronic {
        myMagazines.append(magazine)
    }
    // ... Add some other custom logic
}

// Swift Array ForEach
myMagazines.removeAll()
magazines.forEach(processSubscription)
print("Number of My Magazines: \(myMagazines.count)")

