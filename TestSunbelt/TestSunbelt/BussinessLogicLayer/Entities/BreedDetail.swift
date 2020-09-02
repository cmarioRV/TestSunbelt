//
//  BreedDetail.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation

struct BreedDetail: Decodable {
    let adaptability: Int?
    let affection_level: Int?
    let alt_names: String?
    let cfa_url: String?
    let child_friendly: Int?
    let country_code: String?
    let country_codes: String?
    let description: String?
    let dog_friendly: Int?
    let energy_level: Int?
    let experimental: Int?
    let grooming: Int?
    let hairless: Int?
    let health_issues: Int?
    let hypoallergenic: Int?
    let id: String?
    let indoor: Int?
    let intelligence: Int?
    let lap: Int?
    let life_span: String?
    let name: String?
    let natural: Int?
    let origin: String?
    let rare: Int?
    let rex: Int?
    let shedding_level: Int?
    let short_legs: Int?
    let social_needs: Int?
    let stranger_friendly: Int?
    let suppressed_tail: Int?
    let temperament: String?
    let vcahospitals_url: String?
    let vetstreet_url: String?
    let vocalisation: Int?
    let wikipedia_url: String?
    
    enum CodingKeys: String, CodingKey {
        case adaptability = "adaptability"
        case affection_level = "affection_level"
        case alt_names = "alt_names"
        case cfa_url = "cfa_url"
        case child_friendly = "child_friendly"
        case country_code = "country_code"
        case country_codes = "country_codes"
        case description = "description"
        case dog_friendly = "dog_friendly"
        case energy_level = "energy_level"
        case experimental = "experimental"
        case grooming = "grooming"
        case hairless = "hairless"
        case health_issues = "health_issues"
        case hypoallergenic = "hypoallergenic"
        case id = "id"
        case indoor = "indoor"
        case intelligence = "intelligence"
        case lap = "lap"
        case life_span = "life_span"
        case name = "name"
        case natural = "natural"
        case origin = "origin"
        case rare = "rare"
        case rex = "rex"
        case shedding_level = "shedding_level"
        case short_legs = "short_legs"
        case social_needs = "social_needs"
        case stranger_friendly = "stranger_friendly"
        case suppressed_tail = "suppressed_tail"
        case temperament = "temperament"
        case vcahospitals_url = "vcahospitals_url"
        case vetstreet_url = "vetstreet_url"
        case vocalisation = "vocalisation"
        case wikipedia_url = "wikipedia_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        adaptability = try values.decodeIfPresent(Int.self, forKey: .adaptability)
        affection_level = try values.decodeIfPresent(Int.self, forKey: .affection_level)
        alt_names = try values.decodeIfPresent(String.self, forKey: .alt_names)
        cfa_url = try values.decodeIfPresent(String.self, forKey: .cfa_url)
        child_friendly = try values.decodeIfPresent(Int.self, forKey: .child_friendly)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        country_codes = try values.decodeIfPresent(String.self, forKey: .country_codes)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        dog_friendly = try values.decodeIfPresent(Int.self, forKey: .dog_friendly)
        energy_level = try values.decodeIfPresent(Int.self, forKey: .energy_level)
        experimental = try values.decodeIfPresent(Int.self, forKey: .experimental)
        grooming = try values.decodeIfPresent(Int.self, forKey: .grooming)
        hairless = try values.decodeIfPresent(Int.self, forKey: .hairless)
        health_issues = try values.decodeIfPresent(Int.self, forKey: .health_issues)
        hypoallergenic = try values.decodeIfPresent(Int.self, forKey: .hypoallergenic)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        indoor = try values.decodeIfPresent(Int.self, forKey: .indoor)
        intelligence = try values.decodeIfPresent(Int.self, forKey: .intelligence)
        lap = try values.decodeIfPresent(Int.self, forKey: .lap)
        life_span = try values.decodeIfPresent(String.self, forKey: .life_span)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        natural = try values.decodeIfPresent(Int.self, forKey: .natural)
        origin = try values.decodeIfPresent(String.self, forKey: .origin)
        rare = try values.decodeIfPresent(Int.self, forKey: .rare)
        rex = try values.decodeIfPresent(Int.self, forKey: .rex)
        shedding_level = try values.decodeIfPresent(Int.self, forKey: .shedding_level)
        short_legs = try values.decodeIfPresent(Int.self, forKey: .short_legs)
        social_needs = try values.decodeIfPresent(Int.self, forKey: .social_needs)
        stranger_friendly = try values.decodeIfPresent(Int.self, forKey: .stranger_friendly)
        suppressed_tail = try values.decodeIfPresent(Int.self, forKey: .suppressed_tail)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        vcahospitals_url = try values.decodeIfPresent(String.self, forKey: .vcahospitals_url)
        vetstreet_url = try values.decodeIfPresent(String.self, forKey: .vetstreet_url)
        vocalisation = try values.decodeIfPresent(Int.self, forKey: .vocalisation)
        wikipedia_url = try values.decodeIfPresent(String.self, forKey: .wikipedia_url)
    }
}
