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
        
        let aboutMenuItem = NSMenuItem(title: "About Sharecord",
                                       action: #selector(about),
                                       keyEquivalent: "")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        let settingsMenuItem = NSMenuItem(title: "Settings",
                                       action: #selector(settings),
                                       keyEquivalent: ",")
        settingsMenuItem.target = self
        menu.addItem(settingsMenuItem)
        
        let quitMenuItem = NSMenuItem(title: "Quit",
                                       action: #selector(quit),
                                       keyEquivalent: "q")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        return menu
    }
    
    @objc
    func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc
    func settings(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc
    func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
