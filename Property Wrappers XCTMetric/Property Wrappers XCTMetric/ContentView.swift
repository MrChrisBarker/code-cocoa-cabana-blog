//
//  ContentView.swift
//  Property Wrappers XCTMetric
//
//  Created by Chris Barker on 07/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Using Property Wrappers in Swift with XCTMetric.")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
