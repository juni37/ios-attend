//
//  TripleButton.swift
//  Explore
//
//  Created by David Yoon on 4/19/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AttendanceButton: View {
    var body: some View {
        HStack {
            TextButton(buttonTitle: "출석", buttonColor: Color.green.opacity(0.7))
            Spacer()
            TextButton(buttonTitle: "지각", buttonColor: Color.purple.opacity(0.7))
            Spacer()
            TextButton(buttonTitle: "결석", buttonColor: Color.red.opacity(0.7))
            Spacer()
            TextButton(buttonTitle: "조퇴", buttonColor: Color.blue.opacity(0.7))
            
        }.padding()
        
    }
}

struct TripleButton_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceButton()
    }
}
