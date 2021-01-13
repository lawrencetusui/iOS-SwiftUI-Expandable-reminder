//
//  ContentView.swift
//  Expandable reminder
//
//  Created by Lawrence Tsui on 13/1/21.
//

import SwiftUI

struct ContentView: View {
    let reminders: [reminder]
    init(){
        let url = Bundle.main.url(forResource: "reminder",
                                  withExtension: "json")!
        // ! means it will work else crash
        let data = try! Data(contentsOf:url)
        reminders = try! JSONDecoder().decode([reminder].self, from: data)
    }
    var body: some View {
        Form{
            Section{
                List(reminders, id: \.text, children: \.children){ reminder in
                    if reminder.children != nil{
                        Label(reminder.text, systemImage:
                                "quote.bubble")
                            .font(.headline)
                    }else{
                        Text(reminder.text)
                    }
                }
            }
        }.navigationBarTitle("reminders")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
