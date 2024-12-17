//
//  AddActivity.swift
//  Project-9-SwiftUI-challenge-activity-tracker
//
//  Created by Kevin Cuadros on 9/12/24.
//

import SwiftUI

struct AddActivity: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = "Title"
    @State private var description: String = "Description content"
    
    var activities: Activity
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add title") {
                    TextField("Title", text: $title)
                }
                Section("Add a description") {
                    TextField("Description", text: $description)
                }
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
                        saveItem()
                    }
                }
            }
        }
    }
    
    func saveItem(){
        let item = ActivityItem(
            title: title,
            description: description,
            countActivity: 1
        )
        activities.items.append(item)
        dismiss()
    }
}

#Preview {
    AddActivity(activities: Activity())
}
