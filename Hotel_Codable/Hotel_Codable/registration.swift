//
//  registration.swift
//  Hotel_Codable
//
//  Created by Anmol Mehta on 27/08/25.
//

import Foundation
struct Registration {
    
    
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wifi: Bool
    var roomType: RoomType
}
struct RoomType: Equatable {
    
    
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    static var all : [RoomType] {
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One king", shortName: "K", price: 209),
                RoomType(id: 2, name: "Penthouse Suit", shortName: "PHS", price: 309)]
    }
}


