//
//  ResetPasswordView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 07/11/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var email: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color.bg.ignoresSafeArea()
            
            VStack(spacing: 50) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200 , height: 120)
                    .padding(.top , 30)
                    .padding(.bottom , 30)
                
                VStack {
                    texts
                    textField
                }
                    
                
                AppButton(title: LocalizedString("send"), background: .buttonBG) {}
                    .overlay(alignment: .center) {
                        Image(.icSend)
                            .offset(x: -50)
                    }
                
                resendButton
                
            }
            .vAlign(.top)
            .padding(.horizontal , 24)
        }
        .toolbarBackground(Color.red, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolBar
        }
        
    }
}

#Preview {
    ResetPasswordView()
}

// MARK: - ToolBar:
extension ResetPasswordView {
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
extension ResetPasswordView {
    private var texts: some View {
        VStack(spacing: 8) {
            Text(LocalizedString("reset_pass_title"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.medium, fontSize: 25))
            
            Text(LocalizedString("reset_pass_desc"))
                .foregroundStyle(.appPlaceholderText)
                .font(.customfont(.regular, fontSize: 14))
                .multilineTextAlignment(.center)
        }
        .padding(.bottom , 40)
    }
    
    private var textField: some View {
        AppTextField(text: $email, placeholder: LocalizedString("email"))
    }
    
    private var resendButton: some View {
        Button {
            
        } label: {
            Text(LocalizedString("resend"))
                .foregroundStyle(.buttonBG)
                .font(.customfont(.medium, fontSize: 16))
        }
    }
}
