// Understanding async/await
// Chris Barker - @MrChrisBarker
// Cocoa-Cabana Code
// www.cocoa-cabana.net

import UIKit


// Standard Codable Struct
struct Quote: Codable {
    var text: String?
}

// Basic Network Error enum
enum ErrorResponse: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}


class ApiService {
        
    func streamQuotes() async throws {
        
        guard let url = URL(string: "https://events.bobross.dev/") else {
            throw ErrorResponse.invalidUrl
        }
        
        let (bytes, response) = try await URLSession.shared.bytes(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ErrorResponse.invalidResponse
        }
        
        for try await line in bytes.lines {
            let quote = try JSONDecoder().decode(Quote.self, from: Data(line.utf8))
            
            guard let quote = quote.text else {
                throw ErrorResponse.invalidData
            }
            
            print("Bob says: \(quote)")
        }
        
    }
    
}
 
// Wrap our call in "Task" to allow this asynchronous function
// to be called from Playgrounds 'Synchronous' flow
Task {
    try await ApiService().streamQuotes()
}
 
