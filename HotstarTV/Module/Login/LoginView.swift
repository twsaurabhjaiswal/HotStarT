////
////  ContentView.swift
////  HotTV
////
////  Created by Apple on 02/08/23.
////
//
import SwiftUI
import AVKit

//struct LoginView: View {
//    @ObservedObject var viewModel = LoginViewModel()
//    var body: some View {
//        NavigationStack {
//            VStack {
////                VStack {
////                    Text("Login")
////                        .foregroundColor(Color.red)
////                        .font(.system(size: 20, weight: .bold))
////                    VStack(alignment: .leading) {
////                        Text("Email:-")
////                            .foregroundColor(Color.black)
////                            .font(.system(size: 20, weight: .medium))
////                        TextField("Email: ", text: $viewModel.loginModel.email)
////                            .font(.system(size: 14, weight: .medium))
////                            .foregroundColor(Color.gray)
////                            .padding(.horizontal, 6)
////                            .padding(.vertical, 13)
////                        //                    .overlay(
////                        //                        RoundedRectangle(cornerRadius: 4)
////                        //                            .stroke(Color.gray, lineWidth: 1)
////                        //                    )
////                            .padding(.bottom, 10)
////                        Text("Password:-")
////                            .font(.system(size: 20, weight: .medium))
////                            .foregroundColor(Color.black)
////                        PasswordTextField(isShowPassword: $viewModel.isShowPassword,
////                                          passwordText: $viewModel.loginModel.password)
////                    }
////                    NavigationLink("Login", destination: DashboardView(presentSideMenu: .constant(true)), isActive: $viewModel.isShowDashboard)
//////                    Button {
//////                        viewModel.isShowDashboard = true
//////                    } label: {
//////                        Text("Login")
//////                            .font(.system(size: 14, weight: .medium))
//////                            .foregroundColor(Color.white)
//////                    }
//////                    .frame(width: 200, height: 50)
//////                    .background(Color.blue)
//////                    .cornerRadius(10)
////                }
//                VStack {
//                    Spacer()
//                    HStack {
//                        Text("Email:")
//                            .foregroundColor(Color.red)
//                            .font(.system(size: 50, weight: .bold))
//
//
//                        TextField("Email", text: $viewModel.loginModel.email)
//                            .font(.headline)
//                            .foregroundColor(.gray)
//                            .padding(.leading, 105)
//                    }
//                    HStack {
//                        Text("Password:")
//                            .foregroundColor(Color.white)
//                            .font(.system(size: 50, weight: .bold))
//                        PasswordTextField(isShowPassword: $viewModel.isShowPassword,
//                                          passwordText: $viewModel.loginModel.password)
//                    }
//
//                    Button {
//                        AppData.shared.setUserLoginStatus(isLogin: true)
//                        viewModel.isShowDashboard = true
//                    } label: {
//                        Text("Login")
//                            .foregroundColor(Color.white)
//                            .font(.system(size: 35, weight: .bold))
//                            .frame(width: 300, height: 50)
//                    }.padding(30)
//                        .background(NavigationLink(destination: DashboardView(presentSideMenu: .constant(false)), isActive: $viewModel.isShowDashboard) { EmptyView() }.opacity(0))
//                    Spacer()
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.black.opacity(0.2))
//        }
//    }
//}

//struct LoginView: View {
//    @State private var selectedItem: Int = 0
//    @FocusState private var focusedItem: Int?
//
//    var body: some View {
//        VStack {
//            ForEach(0..<5, id: \.self) { index in
//                Button(action: {
//                    selectedItem = index
//                }) {
//                    Text("Item \(index)")
//                        .padding()
////                        .background(selectedItem == index ? Color.blue : Color.clear)
////                        .foregroundColor(selectedItem == index ? Color.white : Color.primary)
//                }
////                .focusSection()
//            }
//        }
//    }
//}

//struct LoginView: View {
//    @ObservedObject var viewModel = LoginViewModel()
//    var body: some View {
////        NavigationView {
//            NavigationStack {
//                List {
//                    Button(action: {
//                        viewModel.navigateAfterFewSeconds(selectedDetail: .detail1)
//                    }) {
//                        Text("Go to Detail View 1 ")
//                    }
//
//                    Button(action: {
//                        viewModel.selectedDetail = .detail2
//                    }) {
//                        Text("Go to Detail View 2 ")
//                    }
//                    Button(action: {
//                        viewModel.selectedDetail = .language
//                    }) {
//                        Text("Choose Language")
//                    }
//                }
//                .navigationTitle("Main View")
//                .sheet(item: $viewModel.selectedDetail) { item in
//                    viewModel.getDestination(item: item)
//                }
//            }
////        }
//    }
//}

//struct LoginView: View {
//    @State private var searchText: String = ""
//    @State private var isSearching: Bool = false
//
//    var body: some View {
//        VStack {
//            if isSearching {
//                TextField("Search", text: $searchText)
//                    .textFieldStyle(DefaultTextFieldStyle())
//                    .padding()
//                    .frame(maxWidth: .infinity)
////                    .focusable(true)
//            } else {
//                Text("Search")
//                    .foregroundColor(.white)
//                    .font(.title)
//            }
//
//            Button(action: {
//                isSearching.toggle()
//                if isSearching {
//                    // Automatically set the focus on the search field
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                        isSearching = true
//                    }
//                }
//            }) {
//                Text(isSearching ? "Cancel" : "Search")
//            }
//            .padding()
//        }
//        .navigationTitle("Search Example")
//        .padding()
//    }
//}

struct LoginView: View {
    @State private var currentVideoIndex: Int = 0
    @State private var isPreviousButtonFocused = false
    @State private var isNextButtonFocused = false
    private let player = AVQueuePlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8") ?? URL(fileURLWithPath: ""))

    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .focusable(true)

            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "backward.fill")
                }

                Spacer()

                Button {
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
            }
            .padding()
        }.onAppear {
        }
    }

    // ... (other parts of the code)

}
