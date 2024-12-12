//
//  ContentView.swift
//  Project-9-SwiftUI-challenge-activity-tracker
//
//  Created by Kevin Cuadros on 7/12/24.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var countActivity: Int
}

@Observable
class Activity {
    var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeData = try? JSONDecoder().decode(
                [ActivityItem].self,
                from: savedItems
            ) {
                items = decodeData
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var openSheet = false
    @State private var activities = Activity()
    
    var body: some View {
        NavigationStack {
            Section {
                VStack {
                    List {
                        ForEach(activities.items) { i in
                            HStack() {
                                VStack(alignment: .leading) {
                                    Text("\(i.title)")
                                    Text("\(i.description)")
                                }
                                Spacer()
                                HStack {
                                    Button {
                                        addCount(i, -1)
                                    } label: {
                                        Image(systemName: "minus.circle")
                                            .font(.title2)
                                            .foregroundStyle(.blue)
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Text("\(i.countActivity)")
                                    
                                    Button {
                                        addCount(i, 1)
                                    } label: {
                                        Image(systemName: "plus.circle")
                                            .font(.title2)
                                            .foregroundStyle(.blue)
                                    }
                                    .buttonStyle(.plain)
                                    
                                }
                            }
                        }
                        .onDelete(perform: remoteItem)
                    }
                }
            }
        
            .sheet(isPresented: $openSheet, content: {
                AddActivity(activities: activities)
            })
            
            .navigationTitle("Activity tracker")
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add activity") {
                        openSheet.toggle()
                    }
                }
            }
        }
    }
    
    
    func remoteItem(_ at: IndexSet) {
        activities.items.remove(atOffsets: at)
    }
    
    func addCount(_ at: ActivityItem, _ operation: Int) {
        activities.items = activities.items.map { item in
            if(item.id == at.id) {
                var activity = item
                activity.countActivity = activity.countActivity + operation
                return activity
            }
            return item
        }
    }
    
}

#Preview {
    ContentView()
}
