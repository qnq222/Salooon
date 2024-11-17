//
//  NotificationsView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 16/11/2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
            ZStack {
                
                Color.bg.ignoresSafeArea()
                
                Text("Hello, World!")
                    .foregroundStyle(.black)
                    .vAlign(.top)
            }
            .customNavigationTitle("Notificaitons")
            .customNavigationShowBarBackButton(true)
    }
}

#Preview {
    NotificationsView()
}
