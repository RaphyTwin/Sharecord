//
//  KeyboardShortcuts+Global.swift
//  Sharecord
//
//  Created by Raphy on 04.06.24.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let createFileClipboard = Self("createFileClipboard", default: .init(.c, modifiers: [.option, .command]))
    static let createBlankFile = Self("createBlankFile", default: .init(.b, modifiers: [.option, .command]))
    static let convertTextToUTF8 = Self("convertTextToUTF8", default: .init(.u, modifiers: [.option, .command]))
    static let uploadToPasteRS = Self("uploadToPasteRS", default: .init(.p, modifiers: [.option, .command]))
}
