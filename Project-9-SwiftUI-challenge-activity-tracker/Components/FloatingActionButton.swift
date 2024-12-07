//
//  FloatingActionButton.swift
//  Project-9-SwiftUI-challenge-activity-tracker
//
//  Created by Kevin Cuadros on 7/12/24.
//

import SwiftUI

struct FloatingActionButton: View {
    
    var icon: String?
    var color: Color
    var action: () -> Void
    
    
    init(
        icon: String? = "plus",
        color: Color = .indigo,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon ?? "plus")
                .padding()
                .fontWeight(.bold)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(Circle())
        }
        .padding()
    }
}

#Preview {
    FloatingActionButton(icon: "plus", color: .red, action: {
        print("FloatingActionButton")
    })
}
