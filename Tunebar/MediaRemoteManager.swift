//
//  GetSong.swift
//  Tunebar
//
//  Created by Mattia on 01/08/24.
//

import Foundation
import PrivateMediaRemote
import SwiftUI

#if canImport(AppKit)
import AppKit
#else
import UIKit
#endif

class MediaRemoteManager: ObservableObject {
    @Published var currentTitle: String = "No Title"
    @Published var albumArtwork: Image? = nil
    
    private var timer: Timer?
    
    init() {
        fetchCurrentTitleAndArtwork()
        startPolling()
    }
    
    deinit {
        stopPolling()
    }
    
    public func fetchCurrentTitleAndArtwork() {
        MRMediaRemoteGetNowPlayingInfo(DispatchQueue.main) { [weak self] info in
            guard let self = self else { return }
            guard let info = info as? [String: Any] else {
                self.currentTitle = "No Title"
                self.albumArtwork = nil
                return
            }
            
            // Fetch title
            self.currentTitle = info[kMRMediaRemoteNowPlayingInfoTitle] as? String ?? "No Title"
            
            // Fetch artwork
            if let artworkData = info[kMRMediaRemoteNowPlayingInfoArtworkData] as? Data {
#if canImport(AppKit)
                if let nsImage = NSImage(data: artworkData) {
                    self.albumArtwork = Image(nsImage: nsImage)
                } else {
                    self.albumArtwork = nil
                }
#else
                if let uiImage = UIImage(data: artworkData) {
                    self.albumArtwork = Image(uiImage: uiImage)
                } else {
                    self.albumArtwork = nil
                }
#endif
            } else {
                self.albumArtwork = nil
            }
        }
    }
    
    private func startPolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.fetchCurrentTitleAndArtwork()
        }
    }
    
    private func stopPolling() {
        timer?.invalidate()
    }
}
