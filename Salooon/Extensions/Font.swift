//
//  Font.swift
//  Salooon
//
//  Created by Ayman AbuMutair on 04/11/2024.
//

import SwiftUI

enum DuCoHeadlineFamily: String {
    case regular  = "DuCoHeadlineArabic-200"
    case medium   = "DuCoHeadlineArabic-400"
    case bold     = "DuCoHeadlineArabic-600"
}


extension Font {
    static func customfont(_ font: DuCoHeadlineFamily, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

