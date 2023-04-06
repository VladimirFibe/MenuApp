//
//  WelcomeRouter.swift
//  MenuApp
//
//  Created by Vladimir on 04.04.2023.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Int)
}

class WelcomRouter: WelcomeRouterProtocol {
    func openImage(for temperature: Int) {
        let controller = ImageViewerModuleBuilder.build(temperature: temperature)
        viewControler?.present(controller, animated: true)
    }
    
    weak var viewControler: WelcomeViewController?
}
