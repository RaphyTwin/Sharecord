//
//  MenuView.swift
//  Sharecord
//
//  Created by Raphy on 03.03.24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button {
            } label: {
                Text("Create File from clipboard")
                    .padding(.vertical)
                    .frame(width: 200)
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            Button {
            } label: {
                Text("Create blank File")
                    .padding(.vertical)
                    .frame(width: 200)
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Text("Quit")
                    .foregroundStyle(Color.red)
                    .padding(.vertical)
                    .frame(width: 200)
            }
            .padding(.top)
        }
        .padding()
        .frame(width: 250, height: 250)
        .controlSize(.extraLarge)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
