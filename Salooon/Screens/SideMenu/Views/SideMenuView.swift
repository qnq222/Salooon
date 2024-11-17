//
//  SideMenuView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 16/11/2024.
//

import SwiftUI

struct SideMenuView: View {
    
    let safeArea: UIEdgeInsets
    @Binding var showMenu: Bool
    @Binding var navRoutes: [SideMenuRoutes]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button {
                showMenu = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
                    .imageScale(.medium)
            }
            .padding(.bottom , 10)
            
            HStack(alignment: .center , spacing: 14) {
                userProfileImage
                
                userNameText
            }
            .padding(.bottom, 100)
            
            VStack(alignment: .leading, spacing: 30) {
                menuButton(LocalizedString("notifications"), "bell.fill")
                menuButton(LocalizedString("my_orders"), "list.clipboard.fill")
                menuButton(LocalizedString("my_account"), "person.crop.circle")
                menuButton(LocalizedString("about"), "info.circle.fill")
                menuButton(LocalizedString("contact_us"), "phone.circle.fill")
                menuButton(LocalizedString("language"), "translate")
            }
            logoutButton
            
        }
        .padding(.horizontal , 10)
        .padding(.vertical , 20)
        .padding(.top , safeArea.top)
        .padding(.bottom , safeArea.bottom)
        .frame(maxWidth: .infinity ,maxHeight: .infinity , alignment: .topLeading)
    }
}

#Preview {
    HomeView()
}


// MARK: - Content:
extension SideMenuView {
    private var userProfileImage: some View {
        Image(.menuPlaceholder)
            .resizable()
            .scaledToFill()
            .frame(width: 82, height: 82)
            .clipShape(.circle)
            .background {
                Image(.dashedBorderd)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 95, height: 95)
            }
            .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 10)
    }
    
    private var userNameText: some View {
        
        Text("Ayman A. AbuMutair")
            .foregroundStyle(.appPlaceholderText)
            .font(.customfont(.regular, fontSize: 20))
    }
    
    @ViewBuilder
    func menuButton(_ title: String , _ image: String ) -> some View {
        Button{
            showMenu = false
            switch image {
            case "bell.fill": navRoutes.append(.Notifications)
            case "list.clipboard.fill": navRoutes.append(.Orders)
            case "person.crop.circle": navRoutes.append(.Profile)
            case "info.circle.fill": navRoutes.append(.About)
            case "phone.circle.fill": navRoutes.append(.Support)
                
            default: break
            }
        } label: {
            HStack {
                
                Image(systemName: image)
                    .foregroundStyle(.white)
                    .imageScale(.medium)
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(.customfont(.regular, fontSize: 20))
            }
        }
        .padding(.horizontal , 16)
    }
    
    private var logoutButton: some View {
        
        Button {
            
        } label: {
            Text("log_out")
                .foregroundStyle(.white)
                .font(.customfont(.regular, fontSize: 20))
        }
        .padding(.horizontal , 16)
        .vAlign(.bottom)
        
    }
}
