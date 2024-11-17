//
//  LanguageManager.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import Foundation

class LanguageManager: ObservableObject {
    
    static let shared = LanguageManager()
    
    @Published var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    
    var isArabic: Bool {
            return currentLanguage == "ar"
        }
    
    func switchLanguage(to language: String) {
        currentLanguage = language
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // Force reload of UI by changing the language bundle
        Bundle.setLanguage(language)
    }

}


extension Bundle {
    private static var bundle: Bundle?

    static func setLanguage(_ language: String) {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            bundle = Bundle.main
            return
        }
        bundle = Bundle(path: path)
    }

    static var localizedBundle: Bundle {
        return bundle ?? Bundle.main
    }
    
    // Function to retrieve localized string from the custom bundle
    static func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return localizedBundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

// Helper function for localized strings
func LocalizedString(_ key: String) -> String {
    return Bundle.localizedString(forKey: key, value: nil, table: nil)
}
