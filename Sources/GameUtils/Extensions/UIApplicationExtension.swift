//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 15/04/21.
//

#if !os(macOS)
import UIKit

public extension UIApplication {

    /// Sets on the `UIApplication` shared instance, the key window view controller a given view controller
    /// - Parameter viewController: The desired view controller to set as root
    class func setRoot(viewController: UIViewController) {
        shared.keyWindow?.rootViewController = viewController
    }

    /// Cleans all the `keyWindow` root view controller, assign nil
    class func releaseRootViewController() {
        shared.keyWindow?.rootViewController = nil
    }

}

#else
#endif
