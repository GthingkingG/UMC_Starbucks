//
//  Fonts.swift
//  UMC_Starbucks
//
//  Created by Air on 5/13/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extraBold
        case bold
        case semiBold
        case regular
        case medium
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .regular:
                return "Pretendard-Regular"
            case .medium:
                return "Pretendard-Medium"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var mainTextExtraBold24: Font {
        return .pretend(type: .extraBold, size: 24)
    }
    
    static var mainTextBold24: Font {
        return .pretend(type: .bold, size: 24)
    }
    
    static var mainTextBold22: Font {
        return .pretend(type: .bold, size: 22)
    }
    
    static var mainTextBold20: Font {
        return .pretend(type: .bold, size: 20)
    }
    
    static var mainTextBold16: Font {
        return .pretend(type: .bold, size: 16)
    }
    
    static var mainTextSemiBold38: Font {
        return .pretend(type: .semiBold, size: 38)
    }
    
    static var mainTextSemibold24: Font {
        return .pretend(type: .semiBold, size: 24)
    }
    
    static var mainTextSemibold16: Font {
        return .pretend(type: .semiBold, size: 16)
    }
    
    static var mainTextSemiBold14: Font {
        return .pretend(type: .semiBold, size: 14)
    }
    
    static var mainTextSemiBold13: Font {
        return .pretend(type: .semiBold, size: 13)
    }
    
    static var mainTextSemiBold12: Font {
        return .pretend(type: .semiBold, size: 12)
    }
    
    static var mainTextSemiBold18: Font {
        return .pretend(type: .semiBold, size: 18)
    }
    
    static var mainTextRegular18: Font {
        return .pretend(type: .regular, size: 18)
    }
    
    static var mainTextRegular13: Font {
        return .pretend(type: .regular, size: 13)
    }
    
    static var mainTextRegular12: Font {
        return .pretend(type: .regular, size: 12)
    }
    
    static var mainTextRegular09: Font {
        return .pretend(type: .regular, size: 9)
    }
    
    static var mainTextMedium16: Font {
        return .pretend(type: .medium, size: 16)
    }
    
    static var mainTextMedium13: Font {
        return .pretend(type: .medium, size: 13)
    }
    
    static var mainTextMedium10: Font {
        return .pretend(type: .medium, size: 10)
    }
    
    static var mainTextMedium8: Font {
        return .pretend(type: .medium, size: 8)
    }
    
    static var mainTextLight14: Font {
        return .pretend(type: .light, size: 14)
    }
    
    //ButtonText
    static var makeMedium18: Font {
        return .pretend(type: .medium, size: 18)
    }
}
