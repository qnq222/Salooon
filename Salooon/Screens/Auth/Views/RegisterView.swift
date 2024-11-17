//
//  RegisterView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var username: String = ""
    @State var email: String = ""
    @State var mobile: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var selectedIndex: Int? = nil
    
    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea()
            
//            ScrollView {
                VStack {
                    topTexts
                        .padding(.top , 40)
                    textFields
                    
                    NavigationLink {
                        ActivateView()
                    } label: {
                        AppButtonText(title: LocalizedString("continue"), background: .buttonBG)
                            .padding(.top , 60)
                    }

                    
                    contactSupport
                        .vAlign(.bottom)
                }
                .padding(.horizontal , 24)
//            }
            .toolbarBackground(Color.red, for: .navigationBar)
            .navigationBarBackButtonHidden()
            .toolbar {
                toolBar
            }
            
        }
    }
}

#Preview {
    RegisterView()
}

// MARK: - ToolBar:
extension RegisterView {
    @ToolbarContentBuilder
    private var toolBar: some ToolbarContent {
        ToolbarItem(placement: .principal) { Color.clear }
        ToolbarItem(placement: .topBarLeading) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .imageScale(.medium)
                    .bold()
                    .foregroundStyle(.appPlaceholderText)
            })
        }
    }
}

// MARK: - Content:
extension RegisterView {
    
    private var topTexts: some View {
        VStack(spacing: 8) {
            Text(LocalizedString("create_account"))
                .font(.customfont(.medium, fontSize: 25))
            
            Text(LocalizedString("create_account_desc"))
                .font(.customfont(.regular, fontSize: 16))
            
        }
        .foregroundStyle(.appPlaceholderText)
    }
    
    private var textFields: some View {
        VStack(spacing: 12){
            AppTextField(text: $username, placeholder: LocalizedString("username"))
            AppTextField(text: $email, placeholder: LocalizedString("email"))
            
            ZStack(alignment: .trailing) {
                AppTextField(text: $mobile, placeholder: LocalizedString("mobile"))
                DropDownButton(selectedOptionIndex: $selectedIndex)
                    .padding(.trailing , 6)
                    .zIndex(1)
            }
            VStack(spacing: 12) {
                PasswordTF(text: $password, placeholder: LocalizedString("password"))
                PasswordTF(text: $passwordConfirmation, placeholder: LocalizedString("password_conf"))
            }
            .zIndex(-1)
        }
        
    }
    
    private var contactSupport: some View{
        HStack {
            
            Text(LocalizedString("contact_support"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.medium, fontSize: 12))
            
            NavigationLink {
                RegisterView()
            } label: {
                Text(LocalizedString("support"))
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(.appPlaceholderText)
                    .underline(color: .appPlaceholderText)
            }
            
            
        }
        .padding(.bottom , 10)
        
    }
}

//ZStack {
//            Color.bg.ignoresSafeArea()
//            VStack {
//                GeometryReader { geometry in
//                    ScrollView {
//                        VStack {
//                            topTexts
//                                .padding(.top , 40)
//                            textFields
//
//                            AppButton(title: LocalizedString("continue"), background: .buttonBG, hasImage: false) {}
//                                .padding(.top , 80)
//                        }
//                        .padding(.horizontal , 24)
//                        .frame(maxWidth: .infinity,
//                               minHeight: geometry.size.height,
//                               alignment: .top)
//                    }
//                }
//                contactSupport
//            }
//            .toolbarBackground(Color.red, for: .navigationBar)
//            .navigationBarBackButtonHidden()
//            .toolbar {
//                toolBar
//            }
//        }
