//
//  VideoPlayerViewModel.swift
//  HotTV
//
//  Created by Apple on 03/08/23.
//

import Foundation
import AVKit
class VideoPlayerViewModel: ObservableObject {
    @Published var videoUrl: String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"
    var movieUrl = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
//    var player: AVPlayer = AVPlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8") ?? URL(filePath: ""))
    @Published var player = AVPlayer()
    @Published var layerPlayer = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4")!)
    @Published var seekForward: Bool = false {
        didSet {
            print("seekForward", seekForward)
        }
    }
    @Published var seekBackward: Bool = false {
        didSet {
            print("seekBackward", seekBackward)
        }
    }
    @Published var currentTime: Double = 0
    @Published var totalDuration: Double = 0
    @Published var isGetTotalDuration: Bool = false
    @Published var videoProgress: Float = 0

//    func getTotalDuration(forVideoAtURL videoURL: URL) {
//        let asset = AVURLAsset(url: videoURL)
//
//        asset.loadValuesAsynchronously(forKeys: ["duration"]) {
//            var duration: CMTime = CMTimeMake(value: 0, timescale: 1)
//            let durationStatus = asset.statusOfValue(forKey: "duration", error: nil)
//            if durationStatus == .loaded {
//                duration = asset.duration
//            }
//            let totalSeconds = CMTimeGetSeconds(duration)
////            completion(totalSeconds)
//            print("totalDuration", totalSeconds)
//            self.totalDuration = totalSeconds
//
//        }
//        isGetTotalDuration = true
//    }
    func onAppearAction() {
//        getTotalDuration(forVideoAtURL: URL(string: videoUrl)!)
    }
//    func setupVideoPLayer() {
////        player = AVPlayer(url: URL(string: videoUrl)!)
//        player.play()
//    }
}
