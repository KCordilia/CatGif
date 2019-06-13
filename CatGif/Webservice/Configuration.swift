//
//  Configuration.swift
//  CatGif
//
//  Created by Karim Cordilia on 13/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import Foundation

class Configuration {
        
    let catGifUrl: URL
    let loremIpsumUrl: URL

    init() {
        catGifUrl = URL(string: "https://thecatapi.com/api/images/get?format=src&type=gif")!
        loremIpsumUrl = URL(string: "https://loripsum.net/api")!
    }
}
