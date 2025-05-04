//
//  MenuView.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI
import UniformTypeIdentifiers
import SettingsAccess
import KeyboardShortcuts

struct MenuView: View {
    @StateObject var viewModel = FileCreationViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Button("Create file from clipboard") {
                    self.viewModel.createFileFromClipboardButton()
                }
                Button("Create blank file") {
                    self.viewModel.createBlankFileButton()
                }
                Button("Convert to UTF-8") {
                    self.viewModel.convertRTFtoTXT()
                }
                Button("Upload to paste.rs") {
                    self.viewModel.uploadToPasteRS() { url, error in
                        if let error = error {
                            print("Something went wrong: \(error)")
                        }
                    }
                }
            }
            Divider()
            Button("About Sharecord") {
                NSApp.activate(ignoringOtherApps: true)
                NSApp.orderFrontStandardAboutPanel()
            }
            SettingsLink {
                Text("Settings...")
            } preAction: {
                NSApp.activate(ignoringOtherApps: true)
            } postAction: {
                NSApp.activate(ignoringOtherApps: true)
            }
            .keyboardShortcut(",", modifiers: [.command])
            Button("Quit Sharecord") {
                NSApp.terminate(self)
            }
            .keyboardShortcut("q", modifiers: [.command])
        }
    }
    init() {
        KeyboardShortcuts.onKeyUp(for: .createFileClipboard) { [self] in
            self.viewModel.createFileFromClipboardButton()
        }
        KeyboardShortcuts.onKeyUp(for: .createBlankFile) { [self] in
            self.viewModel.createBlankFileButton()
        }
        KeyboardShortcuts.onKeyUp(for: .convertTextToUTF8) { [self] in
            self.viewModel.convertRTFtoTXT()
        }
        KeyboardShortcuts.onKeyUp(for: .uploadToPasteRS) { [self] in
            self.viewModel.uploadToPasteRS() { url, error in
                if let error = error {
                    print("Something went wrong: \(error)")
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .frame(width: 250, height: 150)
    }
}
