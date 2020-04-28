//
//  SignInView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignInView : View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore
    @Environment(\.window) var window: UIWindow?
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil


    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }

    var body: some View {
        VStack {
            VStack{
                Spacer()
                Image("AppLogo")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                Spacer()
                VStack {
                    SignInWithApple()
                        .frame(width: 280, height: 60)
                        .onTapGesture(perform: showAppleLogin)

                    .buttonStyle(SignInButtonStyle(buttonColor: Color.white))

                }
                                
            }

            if (error) {
                Text("Sign In Again!")
            }
        }
    }
    
    private func showAppleLogin() {
      let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.fullName, .email]

      performSignIn(using: [request])
    }

    /// Prompts the user if an existing iCloud Keychain credential or Apple ID credential is found.
    private func performExistingAccountSetupFlows() {
      #if !targetEnvironment(simulator)
      // Note that this won't do anything in the simulator.  You need to
      // be on a real device or you'll just get a failure from the call.
      let requests = [
        ASAuthorizationAppleIDProvider().createRequest(),
        ASAuthorizationPasswordProvider().createRequest()
      ]

      performSignIn(using: requests)
      #endif
    }

    private func performSignIn(using requests: [ASAuthorizationRequest]) {
      appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
        if success {
          // update UI
            
        } else {
          // show the user an error
        }
      }

      let controller = ASAuthorizationController(authorizationRequests: requests)
      controller.delegate = appleSignInDelegates
      controller.presentationContextProvider = appleSignInDelegates

      controller.performRequests()
    }
}

struct SignInButtonStyle: ButtonStyle {
    @State var buttonColor : Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .accentColor(.white)
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
