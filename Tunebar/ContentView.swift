//
//  ContentView.swift
//  Tunebar
//
//  Created by Mattia on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mediaRemoteManager = MediaRemoteManager()

    var body: some View {
        VStack {
            if let artwork = mediaRemoteManager.albumArtwork {
                artwork
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            } else {
                Text("No Artwork")
                    .font(.largeTitle)
                    .padding()
            }

            Text(mediaRemoteManager.currentTitle)
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            mediaRemoteManager.fetchCurrentTitleAndArtwork()
        }
    }
}

#Preview {
    ContentView()
}
