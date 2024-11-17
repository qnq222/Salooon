//
//  AppNavigationBar.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 05/11/2024.
//

import SwiftUI

struct AppNavigationBar: View {
    
    @Environment(\.dismiss) var dismiss
    let showBackButton: Bool
    let title: String
    let showTitleImage: Bool
    let leadingToolbarItem: AnyView?
    let trailingToolbarItem: AnyView?
    
    var body: some View {
        ZStack{
            
            FirstNavWave()
                .fill(Color.appPlaceholderText.opacity(0.14))
                .frame(height: DeviceUtils.hasDynamicIsland() ? 81.93 : 91.93)
                .offset(y: 20)
            
            SecondNavWave()
                .fill(Color.appPlaceholderText.opacity(0.14))
                .frame(height: DeviceUtils.hasDynamicIsland() ? 80.74 : 80.74)
                .offset(y: 20)
            
            ThirdNavWave()
                .fill(Color.appPlaceholderText)
                .frame(height: DeviceUtils.hasDynamicIsland() ? 120 : 112.73)
            
            HStack {
                if showBackButton {backButton}
                
                if showTitleImage {
                    Image(.logoNav)
                        .padding(.top)
                        .hAlign(.center)
                } else {
                    titleSection
                        .padding(.top,DeviceUtils.hasDynamicIsland() ? 19 : 10)
                        .hAlign(.center)
                }
                
            }
            .overlay(alignment: .leading) {
                if let leading = leadingToolbarItem {
                    leading
                        .padding(.top , 14)
                }
            }
            .overlay(alignment: .trailing) {
                if let trailing = trailingToolbarItem {
                    trailing
                        .padding(.top , 14)
                }
            }
            .offset(y: 4)
            .padding(.horizontal)
            
        }
        .background(.bg)
        .ignoresSafeArea(edges: .top)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .imageScale(.large)
                .foregroundStyle(.white)
            
        }
    }
    
    private var titleSection: some View {
        Text(title)
            .foregroundStyle(.white)
            .font(.customfont(.regular, fontSize: 18))
    }
}

#Preview {
    AppNavigationBar(showBackButton: true, title: "Register", showTitleImage: true , leadingToolbarItem: nil, trailingToolbarItem: nil)
}

struct FirstNavWave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99898*width, y: 0.63977*height))
        path.addCurve(to: CGPoint(x: 0.52307*width, y: 0.48162*height), control1: CGPoint(x: 0.99898*width, y: 0.63977*height), control2: CGPoint(x: 0.72079*width, y: -0.46199*height))
        path.addCurve(to: CGPoint(x: 0.01409*width, y: 0.76407*height), control1: CGPoint(x: 0.32535*width, y: 1.42524*height), control2: CGPoint(x: 0.01409*width, y: 0.76407*height))
        path.addLine(to: CGPoint(x: 0.00124*width, y: 0.29125*height))
        path.addCurve(to: CGPoint(x: 0.51023*width, y: 0.0088*height), control1: CGPoint(x: 0.00124*width, y: 0.29125*height), control2: CGPoint(x: 0.24476*width, y: -0.03611*height))
        path.addCurve(to: CGPoint(x: 0.99882*width, y: 0.15952*height), control1: CGPoint(x: 0.77569*width, y: 0.05371*height), control2: CGPoint(x: 0.99882*width, y: 0.15952*height))
        path.addLine(to: CGPoint(x: 0.99898*width, y: 0.63977*height))
        path.closeSubpath()
        return path
    }
}


struct SecondNavWave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.00267*width, y: 0.44631*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.63998*height), control1: CGPoint(x: 0.78059*width, y: 1.55715*height), control2: CGPoint(x: 0, y: 0.63998*height))
        path.addLine(to: CGPoint(x: 0, y: 0.00064*height))
        path.addCurve(to: CGPoint(x: 0.43267*width, y: 0.23215*height), control1: CGPoint(x: 0, y: 0.00064*height), control2: CGPoint(x: 0.16992*width, y: -0.02391*height))
        path.addCurve(to: CGPoint(x: 1.00267*width, y: 0.00064*height), control1: CGPoint(x: 0.69542*width, y: 0.48821*height), control2: CGPoint(x: 1.00267*width, y: 0.00064*height))
        path.addCurve(to: CGPoint(x: 1.00267*width, y: 0.44631*height), control1: CGPoint(x: 1.00267*width, y: 0.00064*height), control2: CGPoint(x: 1.00482*width, y: 0.29497*height))
        path.closeSubpath()
        return path
    }
}


struct ThirdNavWave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.87317*height))
        path.addCurve(to: CGPoint(x: 0.48764*width, y: 0.87317*height), control1: CGPoint(x: width, y: 0.87317*height), control2: CGPoint(x: 0.68226*width, y: 1.1519*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.87317*height), control1: CGPoint(x: 0.29302*width, y: 0.59443*height), control2: CGPoint(x: 0, y: 0.87317*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}


    
