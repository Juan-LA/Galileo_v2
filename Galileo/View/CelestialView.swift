//
//  NewCelestialView.swift
//  Galileo
//
//  Created by Juan Liut on 14/07/23.
//

import SwiftUI

struct NewCelestialView: View {
    
    ///For the custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    ///Celestial that will be displayed
    @State var selectedCelestial : Celestial
    
    
    
    ///Flag to activate or not the comparison
    @State var comparisonOn : Bool = false
    
    var body: some View {
        GeometryReader{
            geometry in
            
            if geometry.size.width > 434 {
                ///For iPad
                
                
                
                
                
            } else {
                ///For iPhone
                NavigationStack{
                    ZStack(alignment: .leading){
                        Image("wallpaper").resizable().ignoresSafeArea()
                        
                        VStack(){
                            ScrollView(){
                                
                                ///Title
                                VStack(alignment: .leading){
                                    Text(verbatim: "Discover").font(.title).foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)
                                    Text(verbatim: selectedCelestial.originName).font(.largeTitle).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                                }.padding(.leading, 15)
                                
                                ///Image
                                VStack(){
//                                    Image(selectedCelestial.image).resizable()
//                                        .aspectRatio(contentMode: .fit).frame(height: 300)
                                    
                                    ///Buttons to compare and see with AR
                                                          ///Celestial's image
                                    ///if comparison is OFF
                                    if !comparisonOn || selectedCelestial.name == "Earth"{
                                        
                                        Image(selectedCelestial.image).resizable()
                                            .aspectRatio(contentMode: .fit).frame(height: 300).padding(.bottom, 25)
                                    } else {
                                        
                                        ///if comparison is ON
                                        if selectedCelestial.big > 1{
                                            HStack(alignment: .center){
                                                Image(selectedCelestial.image).resizable().aspectRatio(contentMode: .fit).frame(height: 300).padding(.bottom, 25)
                                                
                                                
                                                Image("earth").resizable().scaledToFit().frame(height: 300 / CGFloat( selectedCelestial.big) )
                                                
                                            }.padding(.leading, 10).padding(.trailing, 10)
                                        } else if selectedCelestial.big < 1{
                                            
                                            HStack(alignment: .center){
                                                Image(selectedCelestial.image).resizable().aspectRatio(contentMode: .fit).padding(.bottom, 25).frame( height: 300 * CGFloat(selectedCelestial.big))
                                                
                                                Image("earth").resizable().aspectRatio(contentMode: .fit).padding(.bottom, 25)
                                            }.padding(.leading, 10).padding(.trailing, 10)
                                        }
                                        
                                    }
                                    
                                    
                                    HStack{
                                        
                                        ///AR button if AR is available
                                        if selectedCelestial.isARavailable{
                                            NavigationLink {
                                                ArView(selectedCelestial: selectedCelestial).tint(.white).tint(.white)
                                            } label: {
                                                Text(verbatim: "See AR").frame(width:80, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                            }.background(btnColor).clipShape(Rectangle()).cornerRadius(16, antialiased: false)
                                        }
                                        
                                        ///Button "Compare to Earth"
                                        if selectedCelestial.name != "Earth"{
                                            Button {
                                                comparisonOn = !comparisonOn
                                            } label: {
                                                if !comparisonOn{
                                                    Text(verbatim: "Compare to Earth").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)}
                                                else {
                                                    Text(verbatim: "End comparison").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                                }
                                            }.background(btnColor).clipShape(Rectangle()).cornerRadius(16, antialiased: true)
                                        }
                                        
                                    }.padding(.bottom, 10)

                                    
                                    
    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                        }
                        
                        
                    }
                }
                
                
                
                
            }
            
            
            
        }
    }
    
    
    
    
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white).padding(.leading, 0)
            }
        }

}

struct NewCelestialView_Previews: PreviewProvider {
    static var previews: some View {
        NewCelestialView(selectedCelestial: defaultCelestial)
    }
}
