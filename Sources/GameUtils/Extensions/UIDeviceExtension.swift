//
//  UIDeviceExtension.swift
//  
//
//  Created by Ricardo Desiderio on 07/03/21.
//

#if !os(macOS)
import UIKit
import AVFoundation

public extension UIDevice {

    /// The height of the notch on bottom of iphone X or later, in CGFloat
    var notchBottomHeight: CGFloat {
        if #available(iOS 11, *) {
            let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
            return bottomInset
        } else {
            return 0
        }
    }

    /// The height of the notch on top of iphone X or later, in CGFloat
    var notchTopHeight: CGFloat {
        if #available(iOS 11, *) {
            let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
            return bottomInset
        } else {
            return 0
        }
    }

    /// Vibrates with soft haptic vibration
    class func vibrateLite() {
        if #available(iOS 10, *) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } else {
            AudioServicesPlaySystemSound(SystemSoundID(1519))
        }
    }

    /// Vibrates with hard haptic vibration
    class func vibrateHard() {
        AudioServicesPlaySystemSound(SystemSoundID(1520))
    }

}

#else
#endif
