//
//  DashboardViewModel.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import Foundation
import AVFoundation
import AVKit
import SwiftUI
class DashboardViewModel: ObservableObject {
    @Published var arrPopularMovies: [ListModel] = []
    @Published var arrForeignShows: [ListModel] = []
    @Published var arrIndianShows: [ListModel] = []
    @Published var currentTab: String = "Video"
    @Published var selectedTab: Int = 0
    @Published var isFocus: Bool = false
    @Published var videoUrl: String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"
    var movieUrl = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
    var player: AVPlayer = AVPlayer()
    var arrayTabs = [TabsModel(title: "Video", id: 1),
                     TabsModel(title: "Live", id: 2),
                     TabsModel(title: "Radio", id: 3)]
    @Published var itemName: String = "Volks Wagen GTI Review"
    @Published var itemDescription: String = "The Volkswagen GTI has long been revered as a benchmark in the hot hatch category, embodying a blend of performance, practicality, and style."
    @Published var itemTags: String = "English • Reality • U/A 16+"
    @Published var selectedButton: Int = 1
    @Published var navigateTo: DashboardDestination?
    @Published var currectVideoUrl: String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"
    @Published var tempUrl: String = ""
    init() {
        player.isMuted = false
    }
    func pausePlayer() {
        player.pause()
//        player.isMuted = true
//        player = AVPlayer()
    }
    @ViewBuilder
    func getDestination(navigateTo: DashboardDestination) -> some View {
        switch navigateTo {
        case .playerFullScreen:
            VideoPlayerView(seekForward: false, seekBackward: false)
        case .selectLanguage:
            SelectLanguageView()
        case .search:
            SearchBarView()
        }
    }
    func onAppearAction() {
        player.play()
        arrPopularMovies = [
            ListModel(
                name: "Baby",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "$100",
                image: "Baby",
                id: 1,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+",
                videoUrl: videoUrl
            ), ListModel(
                name: "Chhichhore",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Chhichhore",
                image: "Chhichhore",
                id: 2,
                description: "Divided by time, united by a tragic incident. In a bittersweet reunion, seven middle -aged friends take a walk down the memorv lane at the least expected.",
                tags: "2019 • 2h 23m • Hindi • U/A 16+",
                videoUrl: movieUrl
            ),
            ListModel(
                name: "IB71",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "IB71",
                image: "IB71",
                id: 3,
                description: "It’s 1971; enemies are closing in! IB officer Dev Jammwal strategises to avert impending attacks. But the plan derails, forcing him to improvise: better combat.",
                tags: "2023 • 1h 58m • 3 Languages • U/A 16+"
            ),
            ListModel(
                name: "Kusthi",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Kusthi",
                image: "Kusthi",
                id: 4,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Mangal",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Mangal",
                image: "Mangal",
                id: 5,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Super30",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Super30",
                image: "Super30",
                id: 6,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Tamil",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Tamil",
                image: "Tamil",
                id: 7,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            )
        ]
        arrForeignShows = [
            ListModel(
                name: "Ashi",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "$100",
                image: "Ashi",
                id: 1,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Friends",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Friends",
                image: "Friends",
                id: 2,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "GF",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "GF",
                image: "GF",
                id: 3,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Life",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Life",
                image: "Life",
                id: 4,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Passion",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                image: "Passion",
                id: 5,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Revenge",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Revenge",
                image: "Revenge",
                id: 6,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Shine",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Shine",
                image: "Shine",
                id: 7,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            )
        ]
        arrIndianShows = [
            ListModel(
                name: "Aashiqana",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "$100",
                image: "Aashiqana",
                id: 1,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Galaxy",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Galaxy",
                image: "Galaxy",
                id: 2,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Janaki",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Janaki",
                image: "Janaki",
                id: 3,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "TamilEp",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "TamilEp",
                image: "TamilEp",
                id: 4,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            ),
            ListModel(
                name: "Trial",
                location: "TRT Lakefront: Toronto",
                date: "Jan 19 to Feb 19, 2023 ",
                time: "5:00 PM - 11:00 PM ",
                price: "Trial",
                image: "Trial",
                id: 5,
                description: "Post 26/11 Mumbai attacks, a special intelligence task force will stop at nothing to foil such assault on the Indian soil.",
                tags: "2015 • 2h 33m • 2 Languages • U/A 16+"
            )
        ]
    }
}

// A video URL
// "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"

