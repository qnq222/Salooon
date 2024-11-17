//
//  AnimatedSideBar.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 11/11/2024.
//

import SwiftUI

struct AnimatedSideBar<Content: View , MenuView: View , Background: View>: View {
    
    // MARK: - Customazation Options:
    var rotatesWhenExpanded: Bool = false
    var disableInteractions: Bool = false
    var sideMenuWidth: CGFloat = 200
    var cornerRadius: CGFloat = 25
    @Binding var showMenu: Bool
    
    @ViewBuilder var content: (UIEdgeInsets) -> Content
    @ViewBuilder var menuView: (UIEdgeInsets) -> MenuView
    @ViewBuilder var background: Background
    
    // MARK: - View Properties:
    @GestureState private var isDragging: Bool = false
    @State private var offsetX: CGFloat = 0
    @State private var lastOffsetX: CGFloat = 0
    @State private var progress: CGFloat = 0 // user to dim content view when side bar is being dragged
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets ?? .zero
            
            HStack(spacing: 0) {
                GeometryReader { _ in
                    menuView(safeArea)
                }
                .frame(width: sideMenuWidth)
                /// Clipping menu interaction beyond it's width
                .contentShape(.rect)
                
                GeometryReader { _ in
                    content(safeArea)
                }
                .frame(width: size.width)
                .overlay{
                    if showMenu {
                        Rectangle()
                            .fill(.appPlaceholderText.opacity(0.2))
                            .onTapGesture {
                                withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                                    reset()
                                }
                            }
                    }
                }
                .mask {
                    RoundedRectangle(cornerRadius: progress * cornerRadius)
                }
                .scaleEffect(rotatesWhenExpanded ? 1 - (progress * 0.1) : 1 , anchor: .trailing)
                .rotation3DEffect(.init(degrees: rotatesWhenExpanded ? (progress * -15) : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            .frame(width: size.width + sideMenuWidth,
                   height: size.height)
            .offset(x: -sideMenuWidth)
            .offset(x: offsetX)
            .contentShape(.rect)
//            .simultaneousGesture(dragGesture)
            
        }
        .background(background)
        .ignoresSafeArea()
        .onChange(of: showMenu) { newValue in
            withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                if newValue {
                    showSideBar()
                } else {
                    reset()
                }
            }
        }
    }
    
    // drag gesture:
    var dragGesture: some Gesture {
        DragGesture()
            .updating($isDragging) { _, out, _ in
                out = true
            }.onChanged { value in
                guard value.startLocation.x > 10 else { return }
                let translationX = isDragging ? max(min(value.translation.width + lastOffsetX , sideMenuWidth) , 0) : 0
                offsetX = translationX
                calculateProgress()
            }.onEnded { value in
                guard value.startLocation.x > 10 else { return }
                withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                    let velocityX = value.velocity.width / 8
                    let total = velocityX + offsetX
                    if total > (sideMenuWidth * 0.5) {
                        showSideBar()
                    } else {
                        reset()
                    }
                }
            }
    }
    
    // show side menu bar:
    func showSideBar() {
        offsetX = sideMenuWidth
        lastOffsetX = offsetX
        showMenu = true
    }
    
    // reset to initial state:
    func reset(){
        offsetX = 0
        lastOffsetX = 0
        showMenu = false
    }
    
    // convert offset into series of progress ranging from 0 - 1
    func calculateProgress(){
        progress = max(min(offsetX / sideMenuWidth , 1) , 0)
    }
    
}
