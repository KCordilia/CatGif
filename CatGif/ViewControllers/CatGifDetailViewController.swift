//
//  CatGifDetailViewController.swift
//  CatGif
//
//  Created by Karim Cordilia on 13/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import UIKit

class CatGifDetailViewController: UIViewController {
    
    let catGifWebservice: CatGifWebservice = CatGifWebservice()
    @IBOutlet weak var catGifImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var text: String!
    
    var selectedImage: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            catGifImage.image = UIImage.gifImageWithData(data: imageToLoad as NSData)
        }
        
        //This is the textview i cant get populated.
        catGifWebservice.getLoremText()
        textView.text = self.catGifWebservice.loremContent
    }
    
}
