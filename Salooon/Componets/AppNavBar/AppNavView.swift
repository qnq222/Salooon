//
//  AppNavView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import SwiftUI

struct AppNavView<Content: View>: View {
    
    let content: Content
    let leadingToolbarItem: AnyView?
    let trailingToolbarItem: AnyView?
//    @Binding var navRoutes: [SideMenuRoutes]
    
    init(leadingToolbarItem: AnyView? = nil, trailingToolbarItem: AnyView? = nil , @ViewBuilder content: () -> Content) {
        self.content = content()
        self.leadingToolbarItem = leadingToolbarItem
        self.trailingToolbarItem = trailingToolbarItem
//        self._navRoutes = navRoutes
    }
    
    var body: some View {
        NavigationStack {
            AppNavigationBarContainer(leadingToolbarItem: leadingToolbarItem, trailingToolbarItem: trailingToolbarItem) {
                content
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
//    AppNavView {
//        Color.red.ignoresSafeArea()
//    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
