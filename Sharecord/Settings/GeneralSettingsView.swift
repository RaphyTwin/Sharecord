//
//  GeneralSettingsView.swift
//  Sharecord
//
//  Created by Raphy on 10.03.24.
//

import SwiftUI
import LaunchAtLogin

struct GeneralSettingsView: View {
    @AppStorage("launchAtLogin") private
    var launchAtLogin = true
    var body: some View {
        Form {
            LaunchAtLogin.Toggle()
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

#Preview {
    GeneralSettingsView()
}
