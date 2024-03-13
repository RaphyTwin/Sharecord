//
//  MenuView.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI
import UniformTypeIdentifiers

struct MenuView: View {
    @State private var emptyText: String = ""
    @State private var clipboardContent: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                NSApp.activate(ignoringOtherApps: true)
                let saveURL = showSavePanel()
                writeTextfromClipboard(to: saveURL)
            } label: {
                Text("Create file from clipboard")
                    .padding(.vertical)
                    .frame(width: 200)
            }
            Button {
                NSApp.activate(ignoringOtherApps: true)
                let saveURL = showSavePanel()
                writeText(to: saveURL)
            } label: {
                Text("Create blank file")
                    .padding(.vertical)
                    .frame(width: 200)
            }
        }
        .padding()
        .controlSize(.extraLarge)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
    private let txt: UTType
        init() {
            guard let type = UTType(tag: "txt", tagClass: .filenameExtension, conformingTo: .compositeContent)
            else {
                fatalError()
            }
            txt = type
        }
    func showSavePanel() -> URL? {
        let savePanel = NSSavePanel()
        savePanel.title = "Save"
        savePanel.prompt = "Save"
        savePanel.nameFieldLabel = "Save As:"
        savePanel.nameFieldStringValue = "code"
        savePanel.allowedContentTypes = [txt]
        savePanel.isExtensionHidden = true
        savePanel.canCreateDirectories = true
        savePanel.allowsOtherFileTypes = false
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
    func writeText(to url: URL?) {
        guard let url = url else { return }
        try? emptyText.write(to: url, atomically: true, encoding: .utf8)
    }
    func writeTextfromClipboard(to url: URL?) {
        guard let url = url else { return }
        try? clipboardContent.write(to: url, atomically: true, encoding: .utf8)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .frame(width: 250, height: 150)
    }
}
