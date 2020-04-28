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
    
    var classes = testDataClasses
    
    init(showModal: Bool) {
        UITableView().separatorColor = UIColor.clear
        self.showModal = showModal
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ReminderView(count: classes.count, iconImage: "calendar.circle.fill", color: Color.red, descriptionText: "수업")
                List {
                    ForEach(classListViewModel.classCellViewModels) { classCellVM in
                        VStack {
                            ClassSummaryView(classCellVM: classCellVM)
                            NavigationLink(destination: ClassDetailView(classDetailViewModel: ClassDetailViewModel(classCellVM: classCellVM))) {
                                EmptyView().frame(width: 0, height: 0, alignment: .center)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        self.classListViewModel.removeClasses(atOffsets: indexSet)
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
                    AddClassesView(classListVM: self.classListViewModel, showModal: self.$showModal)
            })
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        classListViewModel.classCellViewModels.remove(atOffsets: offsets)
    }
}

struct ClassListView_Previews: PreviewProvider {
    @State var showModal: Bool = false
    
    static var previews: some View {
        Group {
            ClassListView(showModal: false)
            ClassListView(showModal: false)
                .previewDevice("iPhone 8")
        }
    }
}
