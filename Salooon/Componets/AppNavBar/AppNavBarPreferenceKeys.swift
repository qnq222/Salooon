//
//  AppNavBarPreferenceKeys.swift
//  Test
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import SwiftUI


//@State private var showBackButton = true
//@State private var title = "Login"
//@Environment(\.dismiss) var dismiss

struct AppNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct AppNavBarHasImagePreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}


struct AppNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: AppNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationShowBarBackButton(_ hidden: Bool) -> some View {
        preference(key: AppNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationHasTitleImage(_ show: Bool) -> some View {
        preference(key: AppNavBarHasImagePreferenceKey.self, value: show)
    }
}
