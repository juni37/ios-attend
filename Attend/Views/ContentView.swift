//
//  ContentView.swift
//  Explore
//
//  Created by David Yoon on 4/19/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            ClassListView()
                .tabItem {
                    VStack {
                        Image(systemName: "book.fill")
                        Text("수업 관리")
                    }
            }
            .tag(0)
            ClassListView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.2.fill")
                        Text("학생 관리")

                    }
            }
            .tag(1)
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
