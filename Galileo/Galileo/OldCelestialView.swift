//import SwiftUI
//
////Structure
///*
//- At the top: title
//     if it's OTD
//     its name
//- Body:
//     image
//     AR button if its AR is available
//     description
//     details
// */
//
//
//
//
//struct OldCelestialView : View {
//    ///For the custom back button
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    
//    
//    
//    ///Celestial that will be displayed
//    @State var selectedCelestial : Celestial
//    
//    
//    
//    ///Flag to activate or not the comparison
//    @State var comparisonOn : Bool = false
//    
//    var body: some View{
//        
//        ///Text that will be "Justified"
//        @State var description = selectedCelestial.description
//        
//        @State var origins = selectedCelestial.originName
//        
//        
//        
//        ZStack{
//            
//            ///Background
//            Image("wallpaper").resizable()
//            
//            VStack(alignment: .leading){
//            
//                
//                ///Title
//                Text("Discover").font(.title).foregroundColor(.gray).padding(.leading, 40).padding(.top, 20)
//                
//                Text(selectedCelestial.name).font(.system(size: 50)).foregroundColor(.white).bold().padding(.leading, 40)
//                
//                ScrollView{
//                    VStack(alignment: .center, spacing: 0){
//                        
//                        ///Celestial's image
//                        ///if comparison is OFF
//                        if !comparisonOn || selectedCelestial.name == "Earth"{
//                            
//                            Image(selectedCelestial.image).padding(.bottom, 25)
//                        } else {
//                            
//                            ///if comparison is ON
//                            if selectedCelestial.big > 1{
//                                HStack(alignment: .center){
//                                    Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25).frame(height: 500)
//                                    
//                                    
//                                    Image("earth").resizable().scaledToFit().frame(height: 500 / CGFloat( selectedCelestial.big) )
//                                    
//                                }.padding(.leading, 10).padding(.trailing, 10)
//                            } else if selectedCelestial.big < 1{
//                                
//                                HStack(alignment: .center){
//                                    Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25).frame( height: 500 * CGFloat(selectedCelestial.big))
//                                    
//                                    Image("earth").resizable().scaledToFit().padding(.bottom, 25)
//                                }.padding(.leading, 10).padding(.trailing, 10)
//                            }
//                            
//                        }
//                        
//                        
//                        HStack{
//                            
//                            ///AR button if AR is available
//                            if selectedCelestial.isARavailable{
//                                NavigationLink {
//                                    ArView(selectedCelestial: selectedCelestial).tint(.white).tint(.white)
//                                } label: {
//                                    Text(verbatim: "See AR").frame(width:80, height: 30, alignment: .center).padding(7).foregroundColor(.white)
//                                }.background(btnColor).clipShape(Rectangle()).cornerRadius(16, antialiased: false)
//                            }
//                            
//                            ///Button "Compare to Earth"
//                            if selectedCelestial.name != "Earth"{
//                                Button {
//                                    comparisonOn = !comparisonOn
//                                } label: {
//                                    if !comparisonOn{
//                                        Text(verbatim: "Compare to Earth").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)}
//                                    else {
//                                        Text(verbatim: "End comparison").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)
//                                    }
//                                }.background(btnColor).clipShape(Rectangle()).cornerRadius(16, antialiased: true)
//                            }
//                            
//                        }.padding(.bottom, 10)
//                        
//                    }.padding(.top, 10)
//                    
//                    ///Body section w/ description and details of the Celestial
//                    VStack(alignment: .leading, spacing: 10){
//                        ///Description
//                        Text("Description").bold().font(.title2)
//                        
//                        Group{
//                            LabelAlignment(text: selectedCelestial.description, textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 100 )
//
//                        }
//                        
//                        ///Name's origin
//                        Text("Origin of the name").bold().font(.title2)
//                        
//                        Group{
//                            LabelAlignment(text: selectedCelestial.originName, textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 100 )
//                        }
//                        
//                        ///Table with the details of the Celestial
//                        Text("Details").bold().font(.title2)
//                        
//                    }.padding(.leading, 40).padding(.trailing, 40).foregroundColor(.white)
//                    
//                    TableView(selectedCelestial: selectedCelestial, geometry: geometry).padding(.bottom, 30)
//                    
//                }
//                
//                
//            }
//            
//                    }.foregroundColor(.white).background(darkness).navigationBarBackButtonHidden(true)
//                        .navigationBarItems(leading: backButton)
//                        .tint(.white)
//    }
//    
//    
//    var backButton: some View {
//            Button(action: {
//                self.presentationMode.wrappedValue.dismiss()
//            }) {
//                Image(systemName: "arrow.left")
//                    .foregroundColor(.white).padding(.leading, 0)
//            }
//        }
//}
//
//struct OldCelestialView_Previews: PreviewProvider {
//   
//    static var previews: some View {
//        OldCelestialView( selectedCelestial: defaultCelestial)
//    }
//    
//}
