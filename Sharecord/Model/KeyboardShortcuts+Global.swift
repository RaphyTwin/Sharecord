//
//  KeyboardShortcuts+Global.swift
//  Sharecord
//
//  Created by Raphy on 04.06.24.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let createFileClipboard = Self("createFileClipboard", default: .init(.c, modifiers: [.control, .option]))
    static let createBlankFile = Self("createBlankFile", default: .init(.b, modifiers: [.control, .option]))
}
