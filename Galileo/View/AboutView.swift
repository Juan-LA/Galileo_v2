//
//  AboutView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI

var presentation = "Hi,\nI've created this app because I was inspired by the wonder children show when they see planets and stars.\nI would therefore like to help them, but also all those who, like me, are passionate about astronomy, to learn more about the solar system, showing them 3D models and curious details about celestial bodies.\nDuring the creation of Galileo, I always focused on inclusivity as well: I would like anyone to be able to use it without problems. For this reason, the colors have been chosen in such a way as to offer maximum contrast and facilitate reading and the reading of descriptions is available through the built-in function in iOS \"Speak Screen\"."

var credits = "Credits\nLogo by Mattia Ballabio \n3D Models by NASA"


struct AboutView: View {
    ///For the custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        
        GeometryReader{
            geometry in
            
          
                if geometry.size.width > 434
                {
                    ///For ipad
                    
                    ZStack(alignment: .topLeading){
                        ///Background
                        Image("wallpaper").resizable()
                        
                        VStack(alignment: .leading){
                            Text("About the").foregroundColor(.gray).font(.title).padding(.leading, 40).padding(.top, 20)
                            Text("App").bold().foregroundColor(.white).font(.title).padding(.leading, 40)
                            
                            ZStack{
                                Rectangle().foregroundColor(darkBackColor).background(btnColor).frame(height: 280).cornerRadius(16)
                                TextView(text: presentation).padding(.trailing, 30).padding(.top, 20).frame(height: 280).padding(.leading, 30)
                                
                                
                            }.padding(.leading, 40).padding(.trailing, 40)
                            
                            
                            
                            Group{
                                
                                ///Credits
                                Text("Special thanks to").bold().foregroundColor(.white).font(.title).padding(.leading, 40).padding(.top, 20)
                                
                                Text("Mattia Ballabio").font(.title2).padding(.top, 5).padding(.leading, 40)
                                Text("for the Logo").foregroundColor(.gray).padding(.leading, 40)
                                
                                Text("NASA").font(.title2).padding(.top, 5).padding(.leading, 40)
                                Text("for the 3D models").foregroundColor(.gray).padding(.leading, 40)
                                
                                ///Section about the developer
                                Text("To see ").foregroundColor(.gray).font(.title).padding(.top, 20).padding(.leading, 40)
                                
                                Text("New projects").bold().foregroundColor(.white).font(.title).padding(.leading, 40)
                                
                            }
                            HStack(alignment: .center){
                                
                                Image(systemName: "globe")
                                Link("GitHub", destination: URL(string: "https://github.com/Juan-LA")!)
                            }.padding(.leading, 40).padding(.top, 5)
                            
                        }
                        
                        
                        
                    }.background(darkness).foregroundColor(.white).navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: backButton)
                    
                    
                } else {
                    ///For iphone
                    ZStack(alignment: .topLeading){
                        ///Background
                        Image("wallpaper").resizable().ignoresSafeArea()
                        
                        VStack(){
                            ScrollView{
                                VStack(alignment: .leading){
                                    Text("About the").foregroundColor(.gray).font(.title).padding(.leading, 15).padding(.top, 20)
                                    Text("App").bold().foregroundColor(.white).font(.title).padding(.leading, 15)
                                    
                                    ZStack{
                                        Rectangle().foregroundColor(darkBackColor).background(btnColor).frame(height: 420).cornerRadius(16)
                                        Text(verbatim: presentation).padding(.trailing, 15).frame(height: 400).padding(.leading, 15)
                                        
                                        
                                    }.padding(.leading, 15).padding(.trailing, 15)
                                    
                                    
                                    
                                    Group{
                                        
                                        ///Credits
                                        Text("Special thanks to").bold().foregroundColor(.white).font(.title).padding(.leading, 15).padding(.top, 20)
                                        
                                        Text("Mattia Ballabio").font(.title2).padding(.top, 5).padding(.leading, 15)
                                        Text("for the Logo").foregroundColor(.gray).padding(.leading, 15)
                                        
                                        Text("NASA").font(.title2).padding(.top, 5).padding(.leading, 15)
                                        Text("for the 3D models").foregroundColor(.gray).padding(.leading, 15)
                                        
                                        ///Section about the developer
                                        Text("To see ").foregroundColor(.gray).font(.title).padding(.top, 20).padding(.leading, 15)
                                        
                                        Text("New projects").bold().foregroundColor(.white).font(.title).padding(.leading, 15)
                                        
                                    }
                                    HStack(alignment: .center){
                                        
                                        Image(systemName: "globe")
                                        Link("GitHub", destination: URL(string: "https://github.com/Juan-LA")!)
                                    }.padding(.leading, 15).padding(.top, 5)
                                    
                                }
                            }
                        }
                        
                        
                        
                    }.background(darkness).foregroundColor(.white).navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: backButton)
                    
                }
            
            
        }
            
    }
    
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white).padding(.leading, -10)
            }
        }
    
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
