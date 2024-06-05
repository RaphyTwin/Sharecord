//
//  SettingsView.swift
//  Sharecord
//
//  Created by Raphy on 10.03.24.
//

import SwiftUI

struct SettingsView: View {
    private enum Tabs: Hashable {
        case general
        case keyBindings
    }
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
                .tag(Tabs.general)
            KeyBindingsSettingsView()
                .tabItem {
                    Label("Key Bindings", systemImage: "keyboard")
                }
                .tag(Tabs.keyBindings)
        }
        .padding(20)
        .frame(width: 375, height: 150)
    }
}

#Preview {
    SettingsView()
}
