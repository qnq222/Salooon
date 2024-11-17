//
//  AppNavLink.swift
//  Test
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import SwiftUI

struct AppNavLink<Label: View , Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        
        NavigationLink {
            
            AppNavigationBarContainer {
                destination
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden()
            
        } label: {
            label
        }

        
       
    }
}

#Preview {
    
    
    
    
}
