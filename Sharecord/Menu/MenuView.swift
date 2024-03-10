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
                Text("Create file from clipboard")
                    .padding(.vertical)
                    .frame(width: 200)
            }
            Button {
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
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .frame(width: 250, height: 150)
    }
}
