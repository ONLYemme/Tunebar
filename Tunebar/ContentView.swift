//
//  ContentView.swift
//  Tunebar
//
//  Created by Mattia on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mediaRemoteManager: MediaRemoteManager

    var body: some View {
        VStack {
            if let artwork = mediaRemoteManager.albumArtwork {
                artwork
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
            } else {
                Text("No Artwork")
                    .font(.title)
                    .padding()
            }

            Text(mediaRemoteManager.currentTitle)
                .font(.title)
                .padding()
        }
        .onAppear {
            mediaRemoteManager.fetchCurrentTitleAndArtwork()
        }
        .frame(width: 200)
    }
}

#Preview {
    ContentView()
        .environmentObject(MediaRemoteManager())
}
