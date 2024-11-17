//
//  SideMenuExView.swift
//  Test
//
//  Created by Ayman AbuMutair on 12/11/2024.
//

import SwiftUI

struct SideMenuExView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading , spacing: 0) {
            
            
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Image(.menuBg)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity , maxHeight: .infinity)
        )
        .frame(maxWidth: .infinity , alignment: .leading)
    }
    
    @ViewBuilder
    func tabButtons(_ title: String , _ image: String) -> some View {
        AppNavLink(destination:  NotificationsView()) {
            HStack(spacing: 13) {
                Image(systemName: image)
                    .imageScale(.large)
                    .frame(width: 30 , height: 30)
                
                Text(title)
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity , alignment: .leading)
        }
        
        
       
    }
}

#Preview {
    SideMenuContentView()
}


extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
        
    }
}
