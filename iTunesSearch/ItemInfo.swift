//
//  ItemInfo.swift
//  iTunesSearch
//
//  Created by Everett Brothers on 10/24/23.
//

import Foundation
import UIKit

struct ItemInfo: Codable {
    var name: String?
    var artist: String?
    var artworkImage: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case artworkImage = "artworkUrl60"
    }
}
