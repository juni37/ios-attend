//
//  ContentView.swift
//  Explore
//
//  Created by David Yoon on 4/19/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var selection = 0
    @State private var loggedin: Bool = false
    @EnvironmentObject var session: SessionStore
    @Environment(\.window) var window: UIWindow?
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (loggedin) {
                TabView(selection: $selection){
                    ClassListView(showModal: false)
                        .tabItem {
                            VStack {
                                Image(systemName: "book.fill")
                                Text("수업 관리")
                            }
                    }
                    .tag(0)
                    StudentListView(showModal: false)
                        .tabItem {
                            VStack {
                                Image(systemName: "person.2.fill")
                                Text("학생 관리")
                                
                            }
                    }
                    .tag(1)
                }.accentColor(.black)
            }
            else {
                SignInView()
                .onAppear {
                    self.performExistingAccountSetupFlows()
                }
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
                self.loggedin = true
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
        
    }
}
