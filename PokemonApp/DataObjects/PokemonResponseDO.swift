//
//  PokemonResponseDO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation
import SwiftUI


struct PokemonResponseDO: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let cries: Cries
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [JSONAny]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let pastAbilities, pastTypes: [JSONAny]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries, forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastAbilities = "past_abilities"
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
    init(
           abilities: [Ability] = [],
           baseExperience: Int = 0,
           cries: Cries = Cries(latest: "", legacy: ""),
           forms: [Species] = [],
           gameIndices: [GameIndex] = [],
           height: Int = 0,
           heldItems: [JSONAny] = [],
           id: Int = 0,
           isDefault: Bool = false,
           locationAreaEncounters: String = "",
           moves: [Move] = [],
           name: String = "",
           order: Int = 0,
           pastAbilities: [JSONAny] = [],
           pastTypes: [JSONAny] = [],
           species: Species = Species(name: "", url: ""),
           sprites: Sprites = Sprites(
               backDefault: "",
               backFemale: nil,
               backShiny: "",
               backShinyFemale: nil,
               frontDefault: "",
               frontFemale: nil,
               frontShiny: "",
               frontShinyFemale: nil,
               other: nil,
               versions: nil,
               animated: nil
           ),
           stats: [Stat] = [],
           types: [TypeElement] = [],
           weight: Int = 0
       ) {
           self.abilities = abilities
           self.baseExperience = baseExperience
           self.cries = cries
           self.forms = forms
           self.gameIndices = gameIndices
           self.height = height
           self.heldItems = heldItems
           self.id = id
           self.isDefault = isDefault
           self.locationAreaEncounters = locationAreaEncounters
           self.moves = moves
           self.name = name
           self.order = order
           self.pastAbilities = pastAbilities
           self.pastTypes = pastTypes
           self.species = species
           self.sprites = sprites
           self.stats = stats
           self.types = types
           self.weight = weight
       }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
    
    var color: Color {
        Color("Color/\(name.capitalizedFirst)")
    }
}

// MARK: - Cries
struct Cries: Codable {
    let latest, legacy: String
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: Home]
    let generationVii: GenerationVii
    let generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork
    let showdown: Sprites

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
        case showdown
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String
    let backFemale: JSONNull?
    let backShiny: String
    let backShinyFemale: JSONNull?
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    init(backDefault: String, backFemale: JSONNull?, backShiny: String, backShinyFemale: JSONNull?, frontDefault: String, frontFemale: JSONNull?, frontShiny: String, frontShinyFemale: JSONNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String
    let frontGray, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal
    let gold, silver: Gold
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
}
