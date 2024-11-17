//
//  ContentView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

struct RootView: View {
    
    @AppStorage("isUserLogged") var isUserLogged: Bool = false
    
    var body: some View {
        ZStack {
            if isUserLogged {
                HomeView()
                    .transition(.move(edge: .bottom))
            } else {
                LoginView{completeOnboarding()}
            }
        }
        .animation(.spring, value: isUserLogged)
    }
    
    
    func completeOnboarding() {
        withAnimation {
           isUserLogged = true
        }
    }
}

#Preview {
    RootView()
}
