//
//  HomeView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var showMenu: Bool = false
    @State var currentTab = "Home"
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CFloat = 0
   

    var body: some View {
        let sideBarWidth = getRect().width - 90
 
        AppNavView(leadingToolbarItem: menuButton , trailingToolbarItem: notificationButton){
            HStack(spacing: 0) {
                // sideMenu:
                SideMenuExView(showMenu: $showMenu)
                
                // content
                ZStack {
                    Color.bg.ignoresSafeArea()
                    
                    Text("Home View")
                }
                .frame(width: getRect().width)
                .overlay {
                    Rectangle()
                        .fill(
                            Color.black.opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                }
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
            
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
    }
    
    private var notificationButton: AnyView {
        AnyView(
            AppNavLink(destination: NotificationsView()){
                Image(systemName: "bell")
                    .foregroundStyle(.white)
                    .imageScale(.large)
            })
    }
    
    private var menuButton: AnyView {
        AnyView(
            Button {
                showMenu.toggle()
            } label: {
                if showMenu {
                    Image(systemName: "xmark")
                        .foregroundStyle(.white)
                } else {
                    Image(.icMenu)
                }
            }
        )
    }
}

#Preview {
    HomeView()
}
