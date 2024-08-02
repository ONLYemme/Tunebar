//
//  MenuBarItemView.swift
//  Tunebar
//
//  Created by Mattia on 02/08/24.
//

import SwiftUI

struct MenuBarItemView: View {
    @EnvironmentObject var mediaRemoteManager: MediaRemoteManager

    var body: some View {
        HStack {
            /*if let artwork = mediaRemoteManager.albumArtwork {
                artwork
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .cornerRadius(4)
            }*/
            Text(mediaRemoteManager.currentTitle)
                .font(.caption)
                .padding([.leading, .trailing], 5)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    MenuBarItemView()
        .environmentObject(MediaRemoteManager())
}
