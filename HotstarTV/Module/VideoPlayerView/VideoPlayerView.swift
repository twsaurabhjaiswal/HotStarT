//
//  VideoPlayerView.swift
//  HotTV
//
//  Created by Apple on 03/08/23.
//

import SwiftUI
import AVKit
//struct VideoPlayerView: View {
//    @ObservedObject var viewModel = VideoPlayerViewModel()
//    var body: some View {
//        VStack {
////            VideoPlayer(player: viewModel.player)
////                .ignoresSafeArea()
//            VStack(alignment: .center) {
//                CustomVideoPlayer(url: $viewModel.videoUrl, player: viewModel.player, isForUrl: true)
//                    .ignoresSafeArea()
//                HStack {
//                    Button {
//                        viewModel.player.pause()
//                        viewModel.videoUrl = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
//                    } label: {
//                        Text("Previous")
//                    }
//                    Button {
//
//                    } label: {
//                        Text("Next")
//                    }
//                }.focusSection()
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
struct VideoPlayerView: View {
    let videoURL = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    @State private var isPlaying = true // Use this state to control play/pause
    @ObservedObject var viewModel = VideoPlayerViewModel()
    @State var seekForward: Bool {
        didSet {
            print("seekForward", seekForward)
        }
    }
    @State var seekBackward: Bool {
        didSet {
            print("seekBackward", seekBackward)
        }
    }

    var body: some View {
        VStack {
            //            if viewModel.isGetTotalDuration {
            CustomVideoPlayerView(videoURL: videoURL, isPlaying: $isPlaying,
                                  seekForward: $viewModel.seekForward,
                                  seekBackward: $viewModel.seekBackward,
                                  currentTime: $viewModel.currentTime,
                                  videoProgress: $viewModel.videoProgress)
            
//            VideoPlayerLayerView(player: viewModel.layerPlayer)
//                .frame(height: 500) // Adjust size as needed
//                            .onAppear {
//                                viewModel.layerPlayer.play()
//                            }
//                            .background(Color.red.opacity(0.3))
            
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            //                Slider(value: $viewModel.currentTime, in: 0...viewModel.totalDuration, step: 0.01)
            //
            //                    .onChange(of: viewModel.currentTime) { _ in
            //                        viewModel.seekBackward = false
            //                        viewModel.seekForward = false
            //                    }
//            ProgressBar(value: $viewModel.videoProgress)
            
            HStack {
                Button(action: {
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.seekBackward = true
                }) {
                    Image(systemName: "gobackward.10")
                }
                
                Button(action: {
                    viewModel.seekForward = true
                }) {
                    Image(systemName: "goforward.10")
                }
            }
            .padding()
            //            }
        }.onAppear {
            viewModel.onAppearAction()
        }
    }
}

struct CustomVideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL
    @Binding var isPlaying: Bool
    @Binding var seekForward: Bool
    @Binding var seekBackward: Bool
    @Binding var currentTime: Double
    @Binding var videoProgress: Float
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        player.play()
        player.isMuted = false
        context.coordinator.setupControls(player: player)
        return playerController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update the view controller if needed
        if isPlaying {
            uiViewController.player?.play()
        } else {
            uiViewController.player?.pause()
        }
        if seekForward {
            seekForward = false
            context.coordinator.forwardTenSeconds(player: uiViewController.player ?? AVPlayer())
        }
        if seekBackward {
            seekBackward = false
            context.coordinator.rewindTenSeconds(player: uiViewController.player ?? AVPlayer())
        }
//        context.coordinator.updateCurrentTime(player: uiViewController.player, currentTime: currentTime)
    }

    class Coordinator: NSObject {
        var parent: CustomVideoPlayerView

        init(_ customVideoPlayerView: CustomVideoPlayerView) {
            self.parent = customVideoPlayerView
        }

        func setupControls(player: AVPlayer) {
            let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
            player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { [weak self] time in
                guard let duration = player.currentItem?.duration.seconds, duration > 0 else { return }
                let currentSeconds = time.seconds
                let progress = Float(currentSeconds / duration)
                self?.parent.videoProgress = progress
            }
        }
        func forwardTenSeconds(player: AVPlayer) {
            guard let playerItem = player.currentItem else { return }
            let currentTime = playerItem.currentTime()
            let newTime = CMTimeAdd(currentTime, CMTime(seconds: 10, preferredTimescale: 1))
            player.seek(to: newTime)
        }
        func rewindTenSeconds(player: AVPlayer) {
            guard let playerItem = player.currentItem else { return }
            let currentTime = playerItem.currentTime()
            let newTime = CMTimeSubtract(currentTime, CMTime(seconds: 10, preferredTimescale: 1))
            player.seek(to: newTime)
        }
        func updateCurrentTime(player: AVPlayer?, currentTime: Double) {
            guard let player = player else { return }
            let newTime = CMTime(seconds: currentTime, preferredTimescale: 1)
            player.seek(to: newTime)
        }
    }
}
struct ProgressBarView: View {
    @Binding var currentTime: TimeInterval
    @Binding var totalTime: TimeInterval

    var body: some View {
        let progress = totalTime > 0 ? CGFloat(currentTime / totalTime) : 0

        return ProgressView(value: progress)
            .progressViewStyle(LinearProgressViewStyle())
            .frame(height: 10)
    }
}
struct ProgressBar: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 8)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 8)
                    .foregroundColor(.blue)
            }
        }
    }
}
struct VideoPlayerLayerView: UIViewRepresentable {
    let player: AVPlayer
    func makeUIView(context: Context) -> UIView {
        let playerLayer = AVPlayerLayer(player: player)
        let view = UIView()
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)
        player.isMuted = false
        player.play()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}
