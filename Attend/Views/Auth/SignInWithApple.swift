//
//  SignInWithApple.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//
import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable {
    // 2
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        // 3
        return ASAuthorizationAppleIDButton()
    }
    
    // 4
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
struct SignInWithApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple()
    }
}
