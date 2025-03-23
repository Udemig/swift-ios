//
//  ContentView.swift
//  Xplatform
//
//  Created by Nail Babazade on 23.03.25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Anasayfa")
                            }
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Ara")
                            }
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Mesajlar")
                            }
                    }
                    .navigationBarTitle("Anasayfa")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        if let user = viewModel.user {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel.shared)
}
