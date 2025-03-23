//
//  NewTweetView.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    TextArea("Neler oluyor", text: $captionText)
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Iptal")
                        .foregroundColor(.blue)
                }), trailing: Button(action: {
                    viewModel.uploadTweet(caption: captionText)
                }, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                Spacer()
            }
        }
    }
}
