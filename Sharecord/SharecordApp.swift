//
//  SharecordApp.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI

@main
struct SharecordApp: App {
    var body: some Scene {
        MenuBarExtra("", systemImage: "doc.text.fill") {
            MenuView()
        }
        Settings {
            SettingsView()
        }
    }
}
