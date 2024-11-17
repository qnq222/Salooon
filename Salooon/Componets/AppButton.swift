//
//  AppButton.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

struct AppButton: View {
    
    var title: String
    var background: Color
    var hasImage: Bool = false
    var action: () -> Void
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.buttonBG.opacity(0.2))
                .frame(height: 42)
                .padding(.horizontal , 40)
                .offset(y: 12)
                
            
            Button {
                action()
            } label: {
                HStack {
                    Text(title)
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundStyle(.buttonText)
                        .frame(maxWidth: .infinity , alignment: hasImage ? .leading : .center)
                        .padding(.leading , hasImage ? 30 : 0)
                        .frame(height: 50)
                        
                    
                    if hasImage {
                        Image(systemName:  LanguageManager.shared.isArabic ? "chevron.left" : "chevron.right")
                            .foregroundStyle(.white)
                            .padding(.trailing , 26)
                    }
                    
                }
                
                    
            }
            .background(.buttonBG)
            .clipShape(.rect(cornerRadius: 8))

            
            
            
            
            
        }
    }
}

struct AppButtonText: View {
    
    var title: String
    var background: Color
    var hasImage: Bool = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.buttonBG.opacity(0.2))
                .frame(height: 42)
                .padding(.horizontal , 40)
                .offset(y: 12)
                
            
            HStack {
                Text(title)
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.buttonText)
                    .frame(maxWidth: .infinity , alignment: hasImage ? .leading : .center)
                    .padding(.leading , hasImage ? 30 : 0)
                    .frame(height: 50)
                    
                
                if hasImage {
                    Image(systemName:  LanguageManager.shared.isArabic ? "chevron.left" : "chevron.right")
                        .foregroundStyle(.white)
                        .padding(.trailing , 26)
                }
                
            }
            .background(.buttonBG)
            .clipShape(.rect(cornerRadius: 8))

            
            
            
            
            
        }
    }
}

#Preview {
//    AppButton(title: "Login", background: .buttonBG, hasImage: true) {
//        
//    }
    
    AppButtonText(title: "", background: .buttonBG)
}
