//
//  Breed.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

struct Breed: Decodable
{
    let alt_names: String?
    let experimental: Int?
    let hairless: Int?
    let hypoallergenic: Int?
    let id: String?
    let life_span: String?
    let name: String?
    let natural: Int?
    let origin: String?
    let rare: Int?
    let rex: Int?
    let short_legs: Int?
    let suppressed_tail: Int?
    let temperament: String?
    let wikipedia_url: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case alt_names = "alt_names"
        case experimental = "experimental"
        case hairless = "hairless"
        case hypoallergenic = "hypoallergenic"
        case id = "id"
        case life_span = "life_span"
        case name = "name"
        case natural = "natural"
        case origin = "origin"
        case rare = "rare"
        case rex = "rex"
        case short_legs = "short_legs"
        case suppressed_tail = "suppressed_tail"
        case temperament = "temperament"
        case wikipedia_url = "wikipedia_url"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alt_names = try values.decodeIfPresent(String.self, forKey: .alt_names)
        experimental = try values.decodeIfPresent(Int.self, forKey: .experimental)
        hairless = try values.decodeIfPresent(Int.self, forKey: .hairless)
        hypoallergenic = try values.decodeIfPresent(Int.self, forKey: .hypoallergenic)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        life_span = try values.decodeIfPresent(String.self, forKey: .life_span)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        natural = try values.decodeIfPresent(Int.self, forKey: .natural)
        origin = try values.decodeIfPresent(String.self, forKey: .origin)
        rare = try values.decodeIfPresent(Int.self, forKey: .rare)
        rex = try values.decodeIfPresent(Int.self, forKey: .rex)
        short_legs = try values.decodeIfPresent(Int.self, forKey: .short_legs)
        suppressed_tail = try values.decodeIfPresent(Int.self, forKey: .suppressed_tail)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        wikipedia_url = try values.decodeIfPresent(String.self, forKey: .wikipedia_url)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}
