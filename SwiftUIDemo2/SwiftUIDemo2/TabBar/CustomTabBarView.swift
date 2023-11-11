//
//  CustomTabBarView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/11.
//

//import SwiftUI
//
//struct CustomTabBar: View {
//    @State private var selectedTab: Tab = .home
//
//    enum Tab {
//        case home, favorites, settings // 定义标签
//    }
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            HomeView()
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//                .tag(Tab.home)
//
//            FavoritesView()
//                .tabItem {
//                    Image(systemName: "star")
//                    Text("Favorites")
//                }
//                .tag(Tab.favorites)
//
//            SettingsView()
//                .tabItem {
//                    Image(systemName: "gear")
//                    Text("Settings")
//                }
//                .tag(Tab.settings)
//        }
//        .accentColor(.blue) // 设置选中时的颜色
//    }
//}
//
//struct HomeView: View {
//    var body: some View {
//        Text("Home Content")
//            .padding()
//    }
//}
//
//struct FavoritesView: View {
//    var body: some View {
//        Text("Favorites Content")
//            .padding()
//    }
//}
//
//struct SettingsView: View {
//    var body: some View {
//        Text("Settings Content")
//            .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar()
//    }
//}





import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .custom

    enum Tab {
        case custom, home, favorites, settings // 定义标签
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            createTabContent(for: .custom, content: ContentView())
            createTabContent(for: .home, content: HomeView())
            createTabContent(for: .favorites, content: FavoritesView())
            createTabContent(for: .settings, content: SettingsView())
        }
        .accentColor(.blue) // 设置选中时的颜色
    }

    private func createTabContent<T: View>(for tab: Tab, content: T) -> some View {
        NavigationView {
            content
                .navigationTitle(tab.title)
        }
        .tabItem {
            Image(systemName: tab.imageName)
            Text(tab.title)
        }
        .tag(tab)
    }
}

extension CustomTabBar.Tab {
    var title: String {
        switch self {
        case .custom: return "Custom"
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .settings: return "Settings"
        }
    }

    var imageName: String {
        switch self {
        case .custom: return "house"
        case .home: return "house"
        case .favorites: return "star"
        case .settings: return "gear"
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar()
//    }
//}
