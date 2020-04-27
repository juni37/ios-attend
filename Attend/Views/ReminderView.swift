//
//  ReminderView.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import SwiftUI

struct ReminderView: View {
    @State var count : Int
    @State var iconImage : String
    @State var color : Color
    @State var descriptionText : String
    
    var body: some View {
        HStack {
            VStack (alignment: .center, spacing: 10) {
                Image(systemName: iconImage)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(color)
                
                Text(descriptionText)
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
