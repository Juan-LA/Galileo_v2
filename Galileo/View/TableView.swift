//
//  TableView.swift
//  
//
//  Created by Juan Liut on 17/04/23.
//

import SwiftUI

struct TableView: View {
        
    var selectedCelestial : Celestial
    
    let specifics : [String] = ["Place inside the Solar System", "Type", "Number of satellites", "Times bigger than Earth", "Radius", "Mass", "Density", "Maximum temperature", "Minimum temperature"]
 
    var body: some View {
        
        var data = getDataAsString(celestial: selectedCelestial)
        
        ZStack{
            
            VStack{
                
                ForEach( 0..<specifics.count ){
                    s in
                    
                    if (!selectedCelestial.type.contains("Planet") && (specifics[s] == "Place inside the Solar System" || specifics[s] == "Number of satellites" )) || (selectedCelestial.type.contains("Planet") && selectedCelestial.name == "Earth" &&  specifics[s] == "Times bigger than Earth"){
                        
                    } else {
                        
                        ///Element of the list:
                        ///- at the left, name
                        ///- at the right, value
                        HStack{
                            ///Left
                            Text(specifics[s]).foregroundColor(.white)
                            Spacer()
                            ///Right
                            Text(data[s]).foregroundColor(.white)
                            
                        }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 20).padding(.bottom, 20)
                        
                        ///Divider
                        if specifics[s] != "Minimum temperature" {
                            Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                        }
                        
                    }
                    
                }
            
            }

        }.background(darkBackColor).cornerRadius(16)
            .padding(.leading, 50).padding(.trailing, 50)
        }
    }
