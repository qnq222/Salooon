//
//  DeviceUtils.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 06/11/2024.
//

import UIKit
import SwiftUI

struct DeviceUtils {
    
    static func hasDynamicIsland() -> Bool {
        guard let window = UIApplication.shared
            .connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow }) else {
            return false
        }
        let topInset = window.safeAreaInsets.top
        
        // Dynamic Island has a larger top inset than the standard notch
        return topInset > 47
    }
    
    /// Checks if the device has a notch or a Dynamic Island
    static func hasNotchOrDynamicIsland() -> Bool {
        let screen = UIScreen.main.bounds.size
        let height = max(screen.width, screen.height)
        
        // Check for devices with a notch or Dynamic Island
        return height >= 812
    }
}
