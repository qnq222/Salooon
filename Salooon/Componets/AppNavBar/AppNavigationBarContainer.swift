//
//  AppNavigationBarContainer.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 05/11/2024.
//

import SwiftUI

struct AppNavigationBarContainer<Content: View>: View {
    
    
    let content: Content
    
    @Environment(\.dismiss) var dismiss
    @State private var showBackButton = false
    @State private var title = ""
    @State private var showTitleImage = false
    
    let leadingToolbarItem: AnyView?
        let trailingToolbarItem: AnyView?
    
    init(leadingToolbarItem: AnyView? = nil, trailingToolbarItem: AnyView? = nil, @ViewBuilder content: () -> Content) {
            self.content = content()
            self.leadingToolbarItem = leadingToolbarItem
            self.trailingToolbarItem = trailingToolbarItem
        }
    
    var body: some View {
        VStack(spacing: 0) {
            AppNavigationBar(showBackButton: showBackButton, title: title, showTitleImage: showTitleImage , leadingToolbarItem: leadingToolbarItem , trailingToolbarItem: trailingToolbarItem)
                .frame(height: 81)
                .background(.bg)
            content
                .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .top)
            
        }
        .onPreferenceChange(AppNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(AppNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = value
        })
        .onPreferenceChange(AppNavBarHasImagePreferenceKey.self, perform: { value in
            self.showTitleImage = value
        })
    }
}

#Preview {
    AppNavigationBarContainer {
//        RegisterView()
        
    }
}
