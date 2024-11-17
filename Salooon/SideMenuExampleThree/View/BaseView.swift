//
//  BaseView.swift
//  Test
//
//  Created by Ayman AbuMutair on 12/11/2024.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    @State var currentTab = "Home"
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
   
    init() {
        // hiding the native tabbar:
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
 
        AppNavView{
            HStack(spacing: 0) {
                
                // sideMenu:
                SideMenuExView(showMenu: $showMenu)
                
                // Main tap:
                VStack(spacing: 0) {
                    TabView(selection: $currentTab) {
                        HomeSideMenu(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar(.hidden, for: .navigationBar)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar(.hidden, for: .navigationBar)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar(.hidden, for: .navigationBar)
                            .tag("Notifications")
                        
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar(.hidden, for: .navigationBar)
                            .tag("Messages")
                        
                    }
                    
                    VStack(spacing: 0) {
                        Divider()
                        HStack(spacing: 0) {
                            tabButtons(image: "house")
                            tabButtons(image: "magnifyingglass")
                            tabButtons(image: "bell")
                            tabButtons(image: "message")
                        }
                        .padding(.top , 15)
                    }
                    
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
            .gesture(dragGesture())
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
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    @ViewBuilder
    func tabButtons(image: String) -> some View {
        Button {
            withAnimation{currentTab = image}
        } label: {
            Image(systemName: image)
                .frame(width: 23, height: 22)
                .imageScale(.medium)
                .foregroundStyle(currentTab == image ? Color.primary : Color.gray)
                .frame(maxWidth: .infinity)
        }
    }
    
    
    func dragGesture() -> some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, out, _ in
                out = value.translation.width
            }
            .onEnded(onEnd(value:))
    }
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        
        offset = gestureOffset
    }
    
    func onEnd(value : DragGesture.Value){
        
    }
}

#Preview {
    BaseView()
}
