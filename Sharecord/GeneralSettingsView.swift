//
//  GeneralSettingsView.swift
//  Sharecord
//
//  Created by Raphy on 10.03.24.
//

import SwiftUI
import ServiceManagement

struct GeneralSettingsView: View {
    @AppStorage("launchAtLogin") private
    var launchAtLogin = true
    var body: some View {
        Form {
            Toggle("Auto start", isOn: $launchAtLogin)
                .onChange(of: launchAtLogin) { _ in
                    if launchAtLogin {
                        try? SMAppService().register()
                    } else {
                        try? SMAppService().unregister()
                    }
                }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

#Preview {
    GeneralSettingsView()
}
