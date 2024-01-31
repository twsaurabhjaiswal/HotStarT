//
//  SwiftUIView.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import SwiftUI
import AVKit
struct DashboardView: View {
    @Environment(\.presentationMode) var presentationMode
//    @State var player = AVPlayer(url:URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!)
    @FocusState var onFocusCell: Int?
    @Binding var presentSideMenu: Bool
    @Environment(\.isFocused) var focused: Bool
    @ObservedObject var viewModel = DashboardViewModel()
    @FocusState var tabBarButtonOnFocus: Int?
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Image("Logo")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text("JioCinema")
                                .foregroundColor(.white)
                                .font(.system(size: 35, weight: .heavy))
                                .padding(.leading, 5)
                                .padding(.trailing, 15)
                            ForEach(viewModel.arrayTabs, id: \.self) { tabItem in
                                HStack {
                                    CustomTabBarItem(tabItem: tabItem,
                                                     currentTab: $viewModel.currentTab,
                                                     didTap: { selectedButtonId in
                                        viewModel.selectedButton = selectedButtonId
                                    }).buttonStyle(TabBarButtonStyle())
                                    .background(viewModel.selectedButton == tabItem.id ? Color.blue : Color.white.opacity(0.5))
                                    .focused($tabBarButtonOnFocus, equals: tabItem.id) // whoever button will active in focus, id of that button will store in selectedButton var.
                                    .cornerRadius(12)
                                    .padding(.horizontal, 20)
                                    .scaleEffect(tabBarButtonOnFocus == tabItem.id ? 1.3 : 1)
                                    .animation(.easeIn(duration: 0.2), value: focused)
                                }
                            }
                            HStack(spacing: 0) {
                                Button {
                                    viewModel.navigateTo = .search
                                } label: {
                                    Image("Search")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                }.padding(.trailing, 30)
                            }.padding(.leading, 20)
                        }.padding(.trailing, 200)
#if os(tvOS)
                        .focusSection()
#endif
                        Spacer()
                        HStack(spacing: 0) {
                            Button {
                                viewModel.navigateTo = .selectLanguage
                            } label: {
                                Image("Language")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                            }.padding(.trailing, 30)
                                .buttonStyle(.bordered)
                            Button {
                                
                            } label: {
                                Image("Profile")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                            }.padding(.trailing, 20)
                                .buttonStyle(.bordered)
                        }
                    }.padding(.top, 15)
#if os(tvOS)
                        .focusSection()
#endif
                    .padding(.leading, 15)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Spacer()
                            Text(viewModel.itemName)
                                .font(.system(size: 40, weight: .bold))
                            Text(viewModel.itemTags)
                                .foregroundColor(.gray)
                                .padding(.top, 5)
                            Text(viewModel.itemDescription)
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 30)
                            HStack {
                                Button {
                                    viewModel.navigateTo = .playerFullScreen
                                } label: {
                                    HStack {
                                        Text("Watch")
                                            .foregroundColor(Color(UIColor.red))
                                            .font(.system(size: 40, weight: .heavy))
                                    }
                                }
                                Spacer() // For making wider scope so that "Watch" button can hover from the top of any button.
                            }
                        }.padding(.leading, 15)
                        Spacer()
                        CustomVideoPlayer(url: $viewModel.currectVideoUrl,
                                          player: viewModel.player,
                                          isForUrl: true, viewModel: viewModel)
                        .cornerRadius(12)
                        .frame(width: UIScreen.main.bounds.width/1.8)
                        .frame(maxHeight: .infinity)
                        .border(focused ? Color.red : Color.clear, width: 5)
#if os(tvOS)
                        .focusable(false) // for making unfocusable view
#endif
                    }.padding(.top, 20)
                        .frame(height: 500)
#if os(tvOS)
                        .focusSection() // For making focusable and behaive correct natively.
#endif
                    if viewModel.currentTab == "Video" {
                        VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text("Popular Movies")
                                        .font(.system(size: 30, weight: .heavy))
                                        .foregroundColor(Color.white)
                                        .padding(.vertical, 20)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(viewModel.arrPopularMovies, id: \.self) { record in
                                                Cell(record: record, didTap: {
                                                    viewModel.navigateTo = .playerFullScreen
                                                }).focused($onFocusCell, equals: record.id)
                                                    .onChange(of: onFocusCell) { newValue in
                                                        if newValue == record.id {
                                                            // Perform an action when this cell is focused
                                                            print("Cell with ID \(record.id) is focused.")
                                                            viewModel.itemName = record.name
                                                            viewModel.itemTags = record.tags
                                                            viewModel.itemDescription = record.description
                                                            viewModel.currectVideoUrl = record.videoUrl
                                                        }
                                                    }
                                            }
                                        }.padding(.top, 25)
                                            .padding(.bottom, 50)
                                    }
                                    Text("Indian Shows")
                                        .font(.system(size: 30, weight: .heavy))
                                        .foregroundColor(Color.white)
                                        .padding(.vertical, 20)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(viewModel.arrIndianShows, id: \.self) { record in
                                                Cell(record: record, didTap: {
                                                    viewModel.navigateTo = .playerFullScreen
                                                })
#if os(tvOS)
                                                .buttonStyle(.card)
#endif
                                            }
                                            Spacer()
                                        }.padding(.top, 25)
                                            .padding(.bottom, 50)
                                    }
                                    Text("Foreign Shows")
                                        .font(.system(size: 30, weight: .heavy))
                                        .foregroundColor(Color.white)
                                        .padding(.bottom, 20)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(viewModel.arrForeignShows, id: \.self) { record in
                                                Cell(record: record, didTap: {
                                                    viewModel.navigateTo = .playerFullScreen
                                                })
#if os(tvOS)
                                                .buttonStyle(.card)
#endif
                                            }
                                        }.padding(.bottom, 50)
                                            .padding(.top, 25)
                                    }
                                }
                        }
                    } else if viewModel.currentTab == "Live" {
                        VStack {
                            Spacer()
                            Text("Live")
                            Spacer()
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.tint.opacity(0.6))
                            .padding(.top, 50)
                    } else if viewModel.currentTab == "Radio" {
                        VStack {
                            Spacer()
                            Text("Radio")
                            Spacer()
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray.opacity(0.6))
                            .padding(.top, 50)
                    } else if viewModel.currentTab == "Sports" {
                        VStack {
                            Spacer()
                            Text("Sports")
                            Spacer()
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray)
                            .padding(.top, 50)
                    }
                }
                Spacer()
            }.padding(20)
            .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
                .onAppear {
                    viewModel.onAppearAction()
                }
                .onDisappear {
                    viewModel.pausePlayer()
                }
                .sheet(item: $viewModel.navigateTo) { item in
                    viewModel.getDestination(navigateTo: item)
                }
        }
    }
}
struct CustomTabBarItem: View {
    var tabItem: TabsModel
    @Environment(\.isFocused) var focused: Bool
    @FocusState var buttonOnFocus: String?
    @Binding var currentTab: String
    @State var selectedButton: Int = 1
    var didTap: ((Int) -> Void)
    var body: some View {
        HStack {
            Button {
                print("action event of tab bar button invoked")
                currentTab = tabItem.title
                print("id", tabItem.id)
                didTap(tabItem.id)
            } label: {
                Text(tabItem.title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .heavy))
            }
//                .focused($buttonOnFocus, equals: tabItem.title) // whoever button will active in focus then the Title of that button will store in selectedButton var.
//                .onChange(of: buttonOnFocus ?? "", perform: { newValue in
//                    if !(buttonOnFocus  == nil) {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                            currentTab = buttonOnFocus ?? ""
//                        })
//                    }
//                })
        }
    }
}
