//
//  AddActivity.swift
//  Project-9-SwiftUI-challenge-activity-tracker
//
//  Created by Kevin Cuadros on 9/12/24.
//

import SwiftUI

struct AddActivity: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddActivity()
}
