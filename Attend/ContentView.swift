//
//  ContentView.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colorList: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange, UIColor.purple]
    
    @State var looking: Bool = true
    var body: some View {
        NavigationView {
            List{
                ReminderView()
                VStack {
                    ClassSummaryView(title: "iOS Programming", time: "7:00 - 9:30", students: 1, color: self.colorList[4])
                    NavigationLink(destination: ClassSummaryView(title: "iOS Programming", time: "7:00 - 9:30", students: 1, color: self.colorList[2])) {
                        EmptyView().frame(width: 0, height: 0, alignment: .center)
                    }
                }
                
            }
            .navigationBarTitle("수업")
        }
    }
}

struct ClassSummaryView: View {
    @State var title : String
    @State var time : String
    @State var students : Int
    @State var color: UIColor
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text(time)
                    .foregroundColor(Color.black.opacity(0.5))
                    .bold()
                    .font(.caption)
                Text(title)
                    .font(.title)
                    .bold()
            }.padding()
            Spacer()
            Text("학생: \(students)명")
                .font(.footnote)
                .padding()
                .offset(x: 0, y: 20)
        }
        .background(Color.init(color).opacity(0.3))
        .cornerRadius(20)
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}


struct ReminderView: View {
    var body: some View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
