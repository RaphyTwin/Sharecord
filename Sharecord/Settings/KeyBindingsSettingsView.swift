//
//  KeyBindingsSettingsView.swift
//  Sharecord
//
//  Created by Raphy on 04.06.24.
//

import SwiftUI
import KeyboardShortcuts

struct KeyBindingsSettingsView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Create file from clipboard:", name: .createFileClipboard)
            KeyboardShortcuts.Recorder("Create blank file:", name: .createBlankFile)
        }
    }
}

#Preview {
    KeyBindingsSettingsView()
}
