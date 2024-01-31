//
//  CustomPlayer.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import UIKit
import SwiftUI
import AVKit
import AVFoundation

struct CustomVideoPlayer: UIViewControllerRepresentable {
    @Binding var url: String
    var player: AVPlayer
    var isForUrl: Bool = false
    let controller = AVPlayerViewController()
    var viewModel: DashboardViewModel = DashboardViewModel()
//    @Binding var videoUrl: URL
    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        if isForUrl {
////            let newPlayerItem = AVPlayerItem(url: URL(string: url) ?? URL(filePath: ""))
////            player. = //AVPlayer(url: URL(string: url) ?? URL(filePath: ""))
//            controller.player = player
//            player.play()
//        } else {
//            controller.player = player
//            player.play()
//        }
        controller.player = player
        player.play()
//        controller.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height)

//        controller.showsPlaybackControls = false
        controller.view.backgroundColor = .clear
        controller.videoGravity = .resizeAspectFill // for remove borders and fit video in whole view
        // controller.requiresLinearPlayback = true
        // controller.allowsPictureInPicturePlayback = false
        // showsPlaybackControls = false
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if viewModel.tempUrl != url {
            let newPlayerItem = AVPlayerItem(url: URL(string: url) ?? URL(filePath: ""))
            player.replaceCurrentItem(with: newPlayerItem)
            print("temp")
            viewModel.tempUrl = url
        }
    }
}
struct CustomVideoPlayerWithBlurEdge: UIViewRepresentable {
    let player = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4") ?? URL(filePath: ""))

    func makeUIView(context: Context) -> UIView {
        let playerView = UIView()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerView.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerView.layer.addSublayer(playerLayer)
        playerView.backgroundColor = .clear
        player.play()
        
        return playerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update any changes here if needed
    }
}
