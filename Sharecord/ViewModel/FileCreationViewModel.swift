//
//  FileCreationViewModel.swift
//  Sharecord
//
//  Created by Raphy on 05.06.24.
//

import SwiftUI
import UniformTypeIdentifiers

class FileCreationViewModel: ObservableObject {
    @Published private var emptyText: String = ""
    func createFileFromClipboardButton() {
        NSApp.activate(ignoringOtherApps: true)
        let saveURL = showSavePanel()
        writeTextfromClipboard(to: saveURL)
    }
    func createBlankFileButton() {
        NSApp.activate(ignoringOtherApps: true)
        let saveURL = showSavePanel()
        writeText(to: saveURL)
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
        let clipboardContent: String = (NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) ?? "")
        guard let url = url else { return }
        try? clipboardContent.write(to: url, atomically: true, encoding: .utf8)
    }
}
