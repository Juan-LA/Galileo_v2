//
//  File.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import Foundation
import SwiftUI

class Celestial: Decodable, Hashable {
    
    var name : String
    var image : String
    var description : String
    var originName : String
    var isARavailable : Bool
    var big : Float
    var type : String = ""
    var nSatellites : Int = 0
    var radius : String
    var mass : String
    var density : String
    var tMax : String
    var tMin : String
    
    init(name: String, image: String, description: String, originName: String, isARavailable: Bool, big: Float, type: String, nSatellites: Int, radius: String, mass: String, density: String, tMax: String, tMin: String){
            self.name = name
            self.image = image
            self.description = description
            self.originName = originName
            self.isARavailable = isARavailable
            self.big = big
            self.type = type
            self.nSatellites = nSatellites
            self.radius = radius
            self.mass = mass
            self.density = density
            self.tMax = tMax
            self.tMin = tMin
        }
    
    static func == (lhs: Celestial, rhs: Celestial) -> Bool {
        if lhs.name == rhs.name && lhs.image == rhs.image && lhs.description == rhs.description && lhs.originName == rhs.originName && lhs.isARavailable == rhs.isARavailable && lhs.big == rhs.big && lhs.type == rhs.type && lhs.nSatellites == rhs.nSatellites && lhs.radius == rhs.radius && lhs.mass == rhs.mass && lhs.density == rhs.density && lhs.tMax == rhs.tMax && lhs.tMin == rhs.tMin {
            return true
        } else {
            return false
        }
    }
    
    enum CodingKeys: String, CodingKey{
        case name
        case image
        case description
        case originName
        case isARavailable
        case big
        case type
        case nSatellites
        case radius
        case mass
        case density
        case tMax
        case tMin
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}


///NOTE: Stars and Satellites don't have additional attributes that make them different from Celestial. So I won't create different classes


///Function to retrieve the list of Planets from JSON
func getListForType(nameType: String) -> [Celestial]{
    var results : [Celestial] = []
    var decoded : [Celestial] = []
    
    guard let url = Bundle.main.url(forResource: "Celestials", withExtension: "json") else {
        fatalError("File not found")
    }
    
    ///Reads data
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoded = try! decoder.decode([Celestial].self, from: data)
    
    for elem in decoded {
        if elem.type.contains(nameType){
            results.append(elem)
        }
    }
    
    return results
}

///Function to retrieve the list of Planets' name from JSON
func getListNamePlanet() -> [String]{
    var celestials : [Celestial] = getListForType(nameType: "Planet" )
    
    var results : [String] = []
    
    for elem in celestials {
        results.append(elem.name)
    }
    
    return results
}

///Function to retrieve data of a Celestial and saves it in a Array String
func getDataAsString(celestial : Celestial) -> [String]{
    var result : [String] = []
    
    ///Place inside the solar system
    result.append(String(getPosition(planet: celestial.name)))
    ///Type
    result.append(celestial.type)
    ///Number of satellites
    result.append(String(celestial.nSatellites))
    ///Times bigger than Earth
    result.append(String(celestial.big))
    ///Radius
    result.append(celestial.radius)
    ///Mass
    result.append(celestial.mass)
    ///Density
    result.append(celestial.density)
    ///Maximum temperature
    result.append(celestial.tMax)
    ///Minimum temperature
    result.append(celestial.tMin)
    
    
    return result
}

///Functions that returns the position of the element inside the solar system
func getPosition(planet: String) -> Int {
    
    var planets = getListForType(nameType: "Planet" )
    var result = 1
    
    for i in planets {
        if i.name == planet{
            return result
        }
        result += 1
    }
    
    return result
    
}
