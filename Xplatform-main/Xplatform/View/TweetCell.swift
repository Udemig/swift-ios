//
//  TweetCell.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.black)
                        Text("@\(tweet.username) .")
                            .foregroundStyle(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    Text(tweet.caption)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            TweetActionsView(tweet: tweet)
            Divider()
        }
        .padding()
    }
}

