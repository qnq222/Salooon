//
//  Extensions.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

extension View {
    
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity , alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity , alignment: alignment)
    }
    
    // MARK: - custom border view with padding:
    
    func border(_ width: CGFloat , _ color: Color) -> some View {
        self
            .padding(.horizontal , 15)
            .padding(.vertical , 10)
            .background {
                RoundedRectangle(cornerRadius: 12 , style: .continuous)
                    .stroke(color ,lineWidth: width)
            }
    }
    
    func fillView(_ color: Color) -> some View {
        self
            .padding(.horizontal , 15)
            .padding(.vertical , 10)
            .background {
                RoundedRectangle(cornerRadius: 5 , style: .continuous)
                    .fill(color)
            }
    }
    
    func disableWithOpacity(_ condition: Bool) -> some View{
        self.disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
    
    func closeKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

