//
//  ContentView.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                HStack {
                    VStack (alignment: .center, spacing: 10) {
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.green)

                        Text("Today")
                            .foregroundColor(Color.black.opacity(0.5))
                        .bold()
                    }.padding()
                    Spacer()
                    Text("6")
                        .bold()
                        .font(.system(size: 30))
                    .padding()
                }
            }
            .navigationBarTitle("수업")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
