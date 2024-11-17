//
//  AppTextField.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

struct AppTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text, prompt: placeholderText())
            .frame(height: 45)
            .padding(.horizontal, 30)
            .background(.white)
            .clipShape(.rect(cornerRadius: 8))
            .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 6)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .font(.customfont(.regular, fontSize: 14))
            .foregroundStyle(.appPlaceholderText)
    }
    
    private func placeholderText() -> Text {
        Text(placeholder)
            .foregroundColor(.appPlaceholderText.opacity(0.6))
            .font(.customfont(.regular, fontSize: 14))
            
    }
}

#Preview {
    ZStack {
        
        Color.bg
        
      
        
    }
}


struct PasswordTF: View {
    
    @Binding var text: String
    var placeholder: String
    @FocusState var isActive: Bool
    @State var showPassword = false
    
    var body: some View {
        ZStack (alignment: .leading){
            
            SecureField("", text: $text , prompt: placeholderText())
                .focused($isActive)
                .frame(height: 45)
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8))
                .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 6)
                .opacity(showPassword ? 0 : 1)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(.appPlaceholderText)
            
            TextField("", text: $text, prompt: placeholderText())
                .focused($isActive)
                .frame(height: 45)
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8))
                .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 6)
                .opacity(showPassword ? 1 : 0)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(.appPlaceholderText)
            
        }
        .overlay(alignment: .trailing) {
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .contentShape(.rect)
                .foregroundStyle(.appPlaceholderText)
                .onTapGesture {
                    showPassword.toggle()
                }
        }
    }
    
    private func placeholderText() -> Text {
        Text(placeholder)
            .foregroundColor(.appPlaceholderText.opacity(0.6))
            .font(.customfont(.regular, fontSize: 14))
            
    }
}
