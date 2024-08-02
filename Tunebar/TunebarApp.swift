//
//  TunebarApp.swift
//  Tunebar
//
//  Created by Mattia on 22/07/24.
//

import SwiftUI

@main
struct TunebarApp: App {
    @StateObject private var mediaRemoteManager = MediaRemoteManager()

    var body: some Scene {
        MenuBarExtra {
            /*ContentView()
                .environmentObject(mediaRemoteManager)*/
        } label: {
            MenuBarItemView()
                .environmentObject(mediaRemoteManager)
        }
    }
}
