//
//  SharecordApp.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI

@main
struct SharecordApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let menuView = MenuView()
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        popOver.contentViewController?.view.window?.makeKey()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton = statusItem?.button {
            
            MenuButton.image = NSImage(systemSymbolName: "doc.text.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    @objc func MenuButtonToggle(sender: AnyObject) {
        
        if popOver.isShown {
            popOver.performClose(sender)
        }
        else {
            if let menuButton = statusItem?.button {
                
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
