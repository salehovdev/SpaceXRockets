//
//  Utilities.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 17.07.25.
//

import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init() { }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            return topViewController(controller: tabController)
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}
