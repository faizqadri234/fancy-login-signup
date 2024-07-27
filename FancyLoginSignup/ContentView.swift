//
//  ContentView.swift
//  FancyLoginSignup
//
//  Created by Rashdan on 2023-01-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home().preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var index = 0
    var body: some View {
        GeometryReader {geo in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                ZStack {
                    Signup(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
            }
            .padding()
        }
        .background(Color("Color").ignoresSafeArea(.all))
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: rect.width, y: 130))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 130))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var password = ""
    @Binding var index: Int
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack (spacing: 10) {
                        Text("Login")
                            .font(.title)
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                
                    Spacer(minLength: 0)
                }
                .padding(.top, 40)
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Enter email", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Enter password", text: self.$password)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                HStack {
                    Spacer(minLength: 0)
                    Text("forgot password?")
                }
                .padding(.horizontal)
                .padding(.top, 30)
                .padding(.bottom, 70)
            }
            .padding()
            .background(Color("Color2"))
            .cornerRadius(30)
            .padding(.bottom, 330)
            .clipShape(CustomShape())
            .contentShape(CustomShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            
            Button(action: {
                
            }) {
                Text("Login")
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}


struct Signup: View {
    @State var email = ""
    @State var password = ""
    @Binding var index: Int
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack (spacing: 10) {
                        Text("SignUp")
                            .font(.title)
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                
                }
                .padding(.top, 40)
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Enter email", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Enter password", text: self.$password)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Confirm password", text: self.$password)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                .padding(.bottom, 70)
            }
            .padding()
            .background(Color("Color2"))
            .cornerRadius(30)
            .padding(.bottom, 330)
            .clipShape(CustomShape2())
            .contentShape(CustomShape2())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            
            Button(action: {
                
            }) {
                Text("Signup")
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
