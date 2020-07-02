// Remove Character Accent from String
// Chris Barker - @MrChrisBarker
// Code, Cocoa, Cabana
// www.cocoa-cabana.net

import UIKit

// Original String
var originalString = "Γειά σου Κόσμε"

// Still has accents
print(originalString.uppercased())

// Uses folding
var formattedString = originalString.folding(options: .diacriticInsensitive,
                                             locale: Locale.current)

// Accents removed
print(formattedString.uppercased())

