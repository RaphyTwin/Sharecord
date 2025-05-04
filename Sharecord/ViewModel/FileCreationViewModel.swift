//
//  FileCreationViewModel.swift
//  Sharecord
//
//  Created by Raphy on 05.06.24.
//

import SwiftUI
import UniformTypeIdentifiers

class FileCreationViewModel: ObservableObject {
    private let pasteboard = NSPasteboard.general
    @Published private var emptyText: String = ""
    func createFileFromClipboardButton() {
        NSApp.activate(ignoringOtherApps: true)
        let saveURL = showSavePanel()
        writeTextFromClipboard(to: saveURL)
    }
    func createBlankFileButton() {
        NSApp.activate(ignoringOtherApps: true)
        let saveURL = showSavePanel()
        writeText(to: saveURL)
    }
    func convertRTFtoTXT() {
        writeUTF8TextFromClipboard()
    }
    func uploadToPasteRS(completion: @escaping (URL?, Error?) -> Void) {
        guard let url = URL(string: "https://paste.rs/") else {
            completion(nil, URLError(.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = getTextFromClipboard().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data,
                  let urlString = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
                  let resultURL = URL(string: urlString) else {
                let error = URLError(.badServerResponse)
                completion(nil, error)
                return
            }
            completion(resultURL, nil)
            self.pasteboard.clearContents()
            self.pasteboard.setString(urlString, forType: .string)
        }
        task.resume()
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
    func getTextFromClipboard() -> String {
        self.pasteboard.string(forType: NSPasteboard.PasteboardType.string) ?? ""
    }
    func writeTextFromClipboard(to url: URL?) {
        let clipboardContent: String = getTextFromClipboard()
        guard let url = url else { return }
        try? clipboardContent.write(to: url, atomically: true, encoding: .utf8)
    }
    func writeUTF8TextFromClipboard() {
        if let clipboardContent = pasteboard.string(forType: .string) {
            if let utf8Data = clipboardContent.data(using: .utf8),
               let utf8String = String(data: utf8Data, encoding: .utf8) {
                pasteboard.clearContents()
                pasteboard.setString(utf8String, forType: .string)
            } else {
                print("Error: The input could not be converted to UTF-8.")
            }
        } else {
            print("Error: No valid content found in clipboard.")
        }
    }
}
