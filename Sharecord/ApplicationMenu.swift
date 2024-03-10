//
//  ApplicationMenu.swift
//  Sharecord
//
//  Created by Raphy on 10.03.24.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    func createMenu() -> NSMenu {
        let menuView = MenuView()
        let topView = NSHostingController(rootView: menuView)
        topView.view.frame.size = CGSize(width: 250, height: 250)
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        return menu
    }
}
