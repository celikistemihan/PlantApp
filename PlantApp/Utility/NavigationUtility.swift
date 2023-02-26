//
//  NavigationUtility.swift
//  PlantApp
//

import UIKit

final class NavigationUtility {
    
    private static var topViewController: UIViewController? {
        guard let window = UIApplication.shared.keyWindow,
              let rootViewController = window.rootViewController else {
            return nil
        }
        
        var topController = rootViewController
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        return topController
    }
    
    static func push(_ viewController: UIViewController) {
        guard let navigationController = NavigationUtility.topViewController as? UINavigationController else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
