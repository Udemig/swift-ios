//
//  LoginView.swift
//  Xplatform
//
//  Created by Mehmet Seyhan on 23.03.2025.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .clipped()
                        .padding(.top, 88)
                        .padding(.bottom, 32)
                    
                    VStack {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
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
                    .padding()
                   
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Sfiremi Unuttum")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.trailing, 32)
                                .padding(.top, 16)
                        }
                    }
                    
                    Button {
                        //giris yap
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Giris Yap")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(.white)
                            .cornerRadius(25)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text("Bir hesabim yok?")
                                .font(.system(size: 14))
                            
                            Text("Kayit ol")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                        
                    }

                }
            }
            .background(Color(.blue))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel.shared)
}
