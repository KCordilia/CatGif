//
//  CatGifWebservice.swift
//  CatGif
//
//  Created by Karim Cordilia on 13/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import Foundation

class CatGifWebservice {
    
    var onDoneWithRetrievingData: ((Data) -> ())?
    
    let configuration: Configuration
    var loremContent: String?
    
    init() {
        configuration = Configuration()
    }
    
    func getData(with amount: Int) {
        for _ in 1...amount {
            URLSession.shared.dataTask(with: configuration.catGifUrl) {
                [weak self] (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                self?.onDoneWithRetrievingData?(data!)
            }.resume()
        }
    }
    
    func getLoremText() {
        URLSession.shared.dataTask(with: configuration.loremIpsumUrl) {
            (data, response, error) in
            if error != nil {
                print(error!)
                return
            } else {
                // I got the data from the api and it prints, but i cant populate the textview with it.
                
                self.loremContent = String(data: data!, encoding: .utf8)
                print("🌋🌋🌋🌋\(self.loremContent)")
            
            }
        }.resume()
    }
}
