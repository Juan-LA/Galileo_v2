//
//  SwiftUIView.swift
//
//
//  Created by Juan Liut on 09/07/23.
//

import SwiftUI

let column_ipad = [GridItem(spacing: 20), GridItem(spacing: 20)]
let column_iphone = [GridItem(spacing: 20)]

struct SearchView: View {
    
    ///Categories that will be displayed
    var categories : [String] = ["Planet", "Star", "Satellite"]
    
    var body: some View {
        
        GeometryReader{
            geometry in
            
            if geometry.size.width > 434 {
                ///For iPad
                if #available(iOS 16.0, *) {
                    NavigationStack{
                        ZStack{
                            ///Background
                            Image("wallpaper").resizable()
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    
                                    ///Title
                                    VStack(alignment: .leading){
                                        Text("Explore the").foregroundColor(.gray).font(.title)
                                        
                                        Text("Solar System").bold().foregroundColor(.white).font(.title)
                                    }.padding(.leading, 40)
                                    
                                    Spacer()
                                    
                                    ///Info button
                                    NavigationLink{
                                        AboutView()
                                    } label: {
                                        Image(systemName: "info.circle").resizable().scaledToFill().foregroundColor(.white).frame(width: 30, height: 30)
                                    }.padding(.trailing, 40)
                                    
                                }.padding(.bottom, 20).padding(.top, 20)
                                
                                ///List categories
                                Spacer()
                                
                                ScrollView{
                                    
                                    VStack{
                                        
                                        ///Categories and tiles
                                        ForEach(categories, id: \.self){
                                            category in
                                            
                                            let temp = getListForType(nameType: category)
                                            
                                            ///Section and tiles
                                            VStack(alignment: .leading){
                                                
                                                ///Title's section
                                                Text("\(category)s").font(.title).bold().foregroundColor(.white).padding(.leading, 40)
                                                
                                                ///Grid with elements
                                                LazyVGrid(columns: column_ipad, alignment: .center, spacing: 20){
                                                    ForEach(temp, id: \.self){
                                                        elem in
                                                        NavigationLink{
                                                            CelestialView(selectedCelestial: elem)
                                                        } label: {
                                                            ZStack(alignment: .leading){
                                                                
                                                                ///Tile's background
                                                                square.cornerRadius(16, antialiased: false).foregroundColor(darkBackColor)
                                                                
                                                                HStack{
                                                                    
                                                                    ///Celestial's name
                                                                    ZStack(alignment: .leading){
                                                                        Text(elem.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                                                        Image( elem.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                                                    }
                                                                }.frame(height: 200)
                                                                
                                                            }.frame( height: 200, alignment: .leading).cornerRadius(16, antialiased: false)
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                }.padding(.leading, 40).padding(.trailing, 40).padding(.bottom, 30)
                                                
                                                ///Divider
                                                if category != "Satellite" {
                                                    
                                                    Divider().background(.white).padding(.leading, 40).padding(.trailing, 40).padding(.bottom, 10)
                                                    
                                                }
                                                
                                            }
                                            
                                        }.cornerRadius(16)
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }.background(darkness).navigationBarBackButtonHidden()
                    }
                } else {
                    // Fallback on earlier versions
                }
                
                
                
            }
            else {
                ///For iPhone
                if #available(iOS 16.0, *) {
                    NavigationStack{
                        ZStack(){
                            ///Background
                            Image("wallpaper").resizable().ignoresSafeArea()
                            //                    Text("Hi").bold().foregroundStyle(.white).font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    
                                    ///Title
                                    VStack(alignment: .leading){
                                        Text("Explore the").foregroundColor(.gray).font(.title)
                                        
                                        Text("Solar System").bold().foregroundColor(.white).font(.title)
                                    }.padding(.leading, 15)
                                    
                                    Spacer()
                                    
                                    ///Info button
                                    NavigationLink{
                                        AboutView()
                                    } label: {
                                        Image(systemName: "info.circle").resizable().scaledToFill().foregroundColor(.white).frame(width: 30, height: 30)
                                    }.padding(.trailing, 15)
                                    
                                }.padding(.bottom, 20).padding(.top, 20)
                                
                                ///List categories
                                Spacer()
                                
                                ScrollView{
                                    
                                    VStack{
                                        
                                        ///Categories and tiles
                                        ForEach(categories, id: \.self){
                                            category in
                                            
                                            let temp = getListForType(nameType: category)
                                            
                                            ///Section and tiles
                                            VStack(alignment: .leading){
                                                
                                                ///Title's section
                                                Text("\(category)s").font(.title).bold().foregroundColor(.white).padding(.leading, 15)
                                                
                                                ///Grid with elements
                                                LazyVGrid(columns: column_iphone, alignment: .center, spacing: 20){
                                                    ForEach(temp, id: \.self){
                                                        elem in
                                                        NavigationLink{
                                                            CelestialView(selectedCelestial: elem)
                                                        } label: {
                                                            ZStack(alignment: .leading){
                                                                
                                                                ///Tile's background
                                                                square.cornerRadius(16, antialiased: false).foregroundColor(darkBackColor)
                                                                
                                                                HStack{
                                                                    
                                                                    ///Celestial's name
                                                                    ZStack(alignment: .leading){
                                                                        Text(elem.name).font(.system(size: 30)).bold().frame( alignment: .topLeading).padding(.leading, 20).padding(.bottom, 20).foregroundColor(.white)
                                                                        Image( elem.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 190)
                                                                    }
                                                                }.frame(height: 200)
                                                                
                                                            }.frame( height: 100, alignment: .leading).cornerRadius(16, antialiased: false)
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                }.padding(.leading, 15).padding(.trailing, 15).padding(.bottom, 30)
                                                
                                                ///Divider
                                                if category != "Satellite" {
                                                    
                                                    Divider().background(.white).padding(.leading, 15).padding(.trailing, 15).padding(.bottom, 10)
                                                    
                                                }
                                                
                                            }
                                            
                                        }.cornerRadius(16)
                                    }
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
                    
                    
                }
            
        }
        
       
    }
}

#Preview {
    SearchView()
}


