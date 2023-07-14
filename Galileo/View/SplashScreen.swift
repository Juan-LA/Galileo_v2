//
//  SwiftUIView.swift
//
//
//  Created by Juan Liut on 09/07/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isVisible = false
    @State private var isActive = false
    
    var body: some View {
        
        GeometryReader{
            geometry in
            
            ///For iPad
            if geometry.size.width > 434 {
                
                ZStack(){
                    
                    Image("wallpaper").resizable().ignoresSafeArea()
                    
                    ///Logo
                    HStack{
                        Image("logo")
                        Text("Galileo").foregroundColor(.white).font(.system(size: 100)).bold()
                        
                            .onAppear {
                                DispatchQueue.main.asyncAfter (deadline: .now()) {
                                    isVisible = true
                                }
                                
                                
                            }
                    }.background(darkness).onAppear {
                        DispatchQueue.main.asyncAfter (deadline: .now() + 2) {
                            
                            self.isActive = true
                        }
                    }
                    
                }.fullScreenCover(isPresented: $isActive, content: {
                    SearchView()}).background(darkness)
                
            }
            
            ///For iPhone
            else {
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    Image("wallpaper").resizable().ignoresSafeArea()
                
                            VStack(alignment: .leading, spacing: 10){
                                Image("logo").resizable().scaledToFit().frame(height: 100)
                                Text("Galileo").bold().foregroundStyle(.white).font(.system(size: 80))
                            }.padding(.leading, 10).background(darkness).onAppear {
                                DispatchQueue.main.asyncAfter (deadline: .now() + 2) {
                                    self.isActive = true
                                }
                            }
                
                
                        }.fullScreenCover(isPresented: $isActive, content: {
                            SearchView()}).background(darkness)
                
                
            }
            
            
        }
        
       
    }
}

#Preview {
    SplashScreen()
}


