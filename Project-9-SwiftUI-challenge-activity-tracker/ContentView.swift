//
//  ContentView.swift
//  Project-9-SwiftUI-challenge-activity-tracker
//
//  Created by Kevin Cuadros on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var openSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    List(0..<10) { i in
                        
                    }
                }
                
                FloatingActionButton(icon: "plus") {
                    openSheet.toggle()
                }
            }
            
            .sheet(isPresented: $openSheet, content: {
                Text("")
            })
            
            .navigationTitle("Activity tracker")
        }
        
    }
}

#Preview {
    ContentView()
}
