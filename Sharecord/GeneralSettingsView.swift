//
//  GeneralSettingsView.swift
//  Sharecord
//
//  Created by Raphy on 10.03.24.
//

import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage("loginItem") private
    var loginItem = true
    var body: some View {
        Form {
            Toggle("Auto start", isOn: $loginItem)
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

#Preview {
    GeneralSettingsView()
}
