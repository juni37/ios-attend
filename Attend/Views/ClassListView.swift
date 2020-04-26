//
//  ContentView.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct ClassListView: View {
    @ObservedObject var classListViewModel = ClassListViewModel()
    
    let colorList: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange, UIColor.purple]
    var classes = testDataClasses
    
    var body: some View {
        NavigationView {
            VStack {
                ReminderView(count: classes.count)
                List {
                    ForEach(classListViewModel.classCellViewModels) { classCellVM in
                        VStack {
                            ClassSummaryView(classCellVM: classCellVM)
                            NavigationLink(destination: ClassSummaryView(classCellVM: classCellVM)) {
                                EmptyView().frame(width: 0, height: 0, alignment: .center)
                            }
                        }
                    }
                    
                }
            }
            .navigationBarTitle("수업")
            .navigationBarItems(trailing: EditButton())
            
        }
        
    }
    
}

struct ClassSummaryView: View {
    @ObservedObject var classCellVM: ClassCellViewModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text(classCellVM.currentClass.time)
                    .foregroundColor(Color.black.opacity(0.5))
                    .bold()
                    .font(.caption)
                Text(classCellVM.currentClass.name)
                    .font(.title)
                    .bold()
            }.padding()
            Spacer()
            Text("학생: \(classCellVM.currentClass.students.count)명")
                .font(.footnote)
                .padding()
                .offset(x: 0, y: 20)
        }
        .background(Color.init(classCellVM.currentClass.color).opacity(0.3))
        .cornerRadius(20)
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}


struct ReminderView: View {
    @State var count : Int
    
    var body: some View {
        HStack {
            VStack (alignment: .center, spacing: 10) {
                Image(systemName: "calendar.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.green)
                
                Text("오늘")
                    .foregroundColor(Color.black.opacity(0.5))
                    .bold()
            }.padding()
            Spacer()
            Text("\(count)")
                .bold()
                .font(.system(size: 30))
                .padding()
        }
        .background(Color.black.opacity(0.03))
        .cornerRadius(20)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListView()
    }
}
