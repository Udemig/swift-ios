//
//  RegistrationView.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthViewModel()
    
    func loadImage(){
        guard let selectedUIImage = selectedUIImage else { return }
        image = Image(uiImage: selectedUIImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image{
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                    }
                }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage)
                }
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullname, placeholder: Text("Adiniz"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Kullanici adi"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Sifre"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                Button {
                    guard let image = selectedUIImage else {
                        return
                    }
                    viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
                } label: {
                    Text("Kayit ol")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(.white)
                        .cornerRadius(25)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Text("Zaten bir hesabim var")
                            .font(.system(size: 14))
                        
                        Text("Giris yap")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                }
            }

        }.background(Color(.blue))
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
