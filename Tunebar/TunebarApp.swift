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
        WindowGroup {
            ContentView()
        }
    }
}
