//
//  Ders04.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 2.03.2025.
//

import SwiftUI
import AVKit

struct CustomModifier: ViewModifier {
    var Opacity: CGFloat
    func body(content: Content) -> some View {
        content.opacity(Opacity)
    }
}

extension AnyTransition {
    static var myTransition: AnyTransition{
        .modifier(active: CustomModifier(Opacity: 10.5), identity: CustomModifier(Opacity: 14.5))
    }
}

struct Ders04: View {
    @State var myState = false
    let mediaUrl: URL? = Bundle.main.url(forResource: "damla", withExtension: "mp4")
    var body: some View {
        VStack{
            ZStack{
                if let url = mediaUrl {
                    VideoPlayer(player: AVPlayer(url: url )) {
                        Text("Damla").font(.title).foregroundStyle(.red).bold()
                            .padding()
                            .frame(width: 380, height: 300)
                    }
                } else {
                    Text("Video bulunamadu")
                }
            }
            if myState{
                RoundedRectangle(cornerRadius: 10).fill(.red)
                    .frame(width: 150, height: 100)
                    .transition(.myTransition)
            }
        }.padding(30)
        
        Button("tikla"){
            withAnimation(.default) {
                myState.toggle()
            }
        }.font(.title).foregroundStyle(.brown)
    }
}

#Preview {
    Ders04()
}
