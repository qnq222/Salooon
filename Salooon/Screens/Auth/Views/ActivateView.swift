//
//  ActivateView.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 07/11/2024.
//

import SwiftUI

struct ActivateView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var code: String = ""
    @State private var timeRemaining: Int = 60
    @State private var timerIsActive = false
    @State var showHome: Bool = false
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }
    
    var body: some View{
        ZStack {
            Color.bg.ignoresSafeArea()
            
            VStack(spacing: 40){
                
                topTexts
                    .padding(.top , 40)
                    .padding(.bottom , 20)
                
                textField
                    
                   
                timerText
                    
                
                resendButton
                    .padding(.bottom , 40)
                
                AppButton(title: LocalizedString("continue"), background: .buttonBG) {
                    showHome = true
                }
            }
            .padding(.horizontal , 24)
            .vAlign(.top)
            .onAppear { startTimer() }
        }
        .fullScreenCover(isPresented: $showHome) {
            HomeView()
        }
        .toolbarBackground(Color.red, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolBar
        }
    }
}

#Preview {
    ActivateView()
}

// MARK: - ToolBar:
extension ActivateView {
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
extension ActivateView {
    private var topTexts: some View {
        VStack(spacing: 18) {
            Text(LocalizedString("activate_account"))
                .font(.customfont(.medium, fontSize: 25))
            
            Text(LocalizedString("activate_account_desc") + " " + "970597689103")
                .font(.customfont(.medium, fontSize: 16))
                .frame(maxWidth: .infinity , alignment: .center)
                .multilineTextAlignment(.center)
            
        }
        .foregroundStyle(.appPlaceholderText)
    }
    
    private var textField: some View {
        VStack(spacing: 40){
            
            AppTextField(text: $code, placeholder: "0  0  0  0")
                .multilineTextAlignment(.center)
            
            Text(LocalizedString("code_auto"))
                .font(.customfont(.medium, fontSize: 14))
                .frame(maxWidth: .infinity , alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundStyle(.appPlaceholderText)
            
        }
    }
    
    private var timerText: some View {
        Text(formattedTime)
            .foregroundStyle(.appPlaceholderText)
            .font(.customfont(.medium, fontSize: 25))
    }
    
    private var resendButton: some View {
        Button {
            
        } label: {
            Text(LocalizedString("resend"))
                .foregroundStyle(.buttonBG)
                .font(.customfont(.medium, fontSize: 16))
        }
        .disableWithOpacity(timerIsActive)
    }
}

// MARK: - Functions:
extension ActivateView {
    private var formattedTime: String {
            let minutes = timeRemaining / 60
            let seconds = timeRemaining % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    
    private func startTimer() {
        if timerIsActive {
            timeRemaining = 120
        }
        timerIsActive = true
        _ = self.timer
    }
    
}
