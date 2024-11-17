//
//  LoginView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var languageManager = LanguageManager()
    @State var username = ""
    @State var password = ""
    
    var onComplete: (() -> Void)? = nil
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg.ignoresSafeArea()
                
                VStack {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200 , height: 120)
                        .padding(.top , 30)
                        .padding(.bottom , 30)
                    
                    texts
                    
                    textFields
                    
                    
                    AppButton(title: LocalizedString("enter"), background: .buttonBG, hasImage: true) {
                       onComplete?()
                    }
                    .padding(.horizontal , 24)
                }
                .vAlign(.top)
                .safeAreaInset(edge: .bottom) {
                    createAccountHstack
                }
            }
            .environmentObject(languageManager)
        }
    }
    
    private var texts: some View {
        VStack(spacing: 8) {
            Text(LocalizedString("login_Text"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.medium, fontSize: 25))
            
            Text(LocalizedString("login_desc"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.regular, fontSize: 12))
        }
        .padding(.bottom , 40)
    }
    
    private var textFields: some View {
        VStack(spacing: 16) {
            AppTextField(text: $username, placeholder: LocalizedString("username"))
            PasswordTF(text: $password, placeholder: LocalizedString("password"))
            
            NavigationLink {
                ResetPasswordView()
            } label: {
                Text(LocalizedString("reset_pass"))
                    .foregroundStyle(.appPlaceholderText)
                    .font(.customfont(.regular, fontSize: 14))
            }
            .frame(maxWidth: .infinity , alignment: .trailing)
            
        }
        .padding(.horizontal , 24)
        .padding(.bottom , 40)
    }
    
    private var createAccountHstack: some View{
        HStack {
            
            Text(LocalizedString("dont_have_account"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.medium, fontSize: 18))
            
            NavigationLink {
                RegisterView()
            } label: {
                Text(LocalizedString("create_account"))
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.buttonBG)
                    .underline(color: .buttonBG)
            }
            
            
        }
        .padding(.bottom , 10)
        
    }
}

#Preview {
    LoginView()
}
