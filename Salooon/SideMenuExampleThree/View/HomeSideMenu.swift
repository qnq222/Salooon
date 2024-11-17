//
//  HomeSideMenu.swift
//  Test
//
//  Created by Ayman AbuMutair on 14/11/2024.
//

import SwiftUI

struct HomeSideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.bg
            
            Button {
                withAnimation {
                    showMenu.toggle()
                }
            } label: {
                Text("Show Menu")
            }
            
        }
        
    }
}

#Preview {
    SideMenuContentView()
}
