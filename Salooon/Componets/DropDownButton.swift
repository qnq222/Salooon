//
//  DropDownButton.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import SwiftUI

struct DropDownButton: View {
    
    var options: [String] = ["+931" , "+932" , "+933" , "+934" , "+935"]
    
    var menuWdith: CGFloat  =  110
    var buttonHeight: CGFloat  =  40
    var maxItemDisplayed: Int  =  3
    
    @Binding var selectedOptionIndex: Int?
    @State var showDropdown: Bool = false
    
    @State private  var scrollPosition: Int?
    
    var body: some  View {
        VStack {
            
            VStack(spacing: 0) {
                // selected item
                Button(action: {
                    withAnimation {
                        showDropdown.toggle()
                    }
                }, label: {
                    HStack(spacing: nil){
                        if let index = selectedOptionIndex {
                            Text(options[index])
                                .font(.customfont(.medium, fontSize: 14))
                        } else {
                            Text(options[0])
                                .font(.customfont(.medium, fontSize: 14))
                        }
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.buttonBG)
                            .rotationEffect(.degrees((showDropdown ?  -180 : 0)))
                    }
                    .foregroundStyle(.appPlaceholderText)
                })
                .padding(.horizontal , 12)
                .frame(width: menuWdith, height: buttonHeight, alignment: .leading)
                
                
                // selection menu
                if (showDropdown) {
                    let scrollViewHeight: CGFloat  = options.count > maxItemDisplayed ? (buttonHeight*CGFloat(maxItemDisplayed)) : (buttonHeight*CGFloat(options.count))
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<options.count, id: \.self) { index in
                                Button(action: {
                                    withAnimation {
                                        selectedOptionIndex = index
                                        showDropdown.toggle()
                                    }
                                    
                                }, label: {
                                    HStack {
                                        Text(options[index])
                                            .font(.customfont(.medium, fontSize: 14))
                                        Spacer()
                                        if (index == selectedOptionIndex) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(.buttonBG)
                                        }
                                    }
                                    .foregroundStyle(.appPlaceholderText)
                                    
                                })
                                .padding(.horizontal, 20)
                                .frame(width: menuWdith, height: buttonHeight, alignment: .leading)
                                
                            }
                        }
                        
                    }
                    .scrollDisabled(options.count <=  3)
                    .frame(height: scrollViewHeight)
                    .onAppear {
                        scrollPosition = selectedOptionIndex
                    }
                    
                }
                
            }
            .foregroundStyle(Color.white)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
            
        }
        .frame(width: menuWdith, height: buttonHeight, alignment: .top)
        .zIndex(100)
        
    }
    
    
}

#Preview {
    DropDownButton(selectedOptionIndex: .constant(0))
}
