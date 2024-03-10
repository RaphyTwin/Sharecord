//
//  SharecordApp.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI

@main
struct SharecordApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    private(set) static var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.image = NSImage(systemSymbolName: "doc.text.fill", accessibilityDescription: nil)
        statusBarItem.menu = menu.createMenu()
    }
}
