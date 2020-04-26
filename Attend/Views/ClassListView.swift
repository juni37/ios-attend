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
    @State var showModal: Bool = false

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
                            NavigationLink(destination: ClassDetailView(classDetailViewModel: ClassDetailViewModel(classCellVM: classCellVM))) {
                                EmptyView().frame(width: 0, height: 0, alignment: .center)
                            }
                        }
                    }
                    
                }
            }
            .navigationBarTitle("수업")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showModal.toggle()}){
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                }
                .sheet(isPresented: $showModal){
                    AddClassesView(showModal: self.$showModal)
            })
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        @State var showModal: Bool = false

        static var previews: some View {
            ClassListView(showModal: false)
        }
    }
}
