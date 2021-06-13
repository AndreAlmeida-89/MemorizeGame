//
//  ContentView.swift
//  Memorize
//
//  Created by Andre Almeida on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
               
            Text("hello")
                .foregroundColor(.orange)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
