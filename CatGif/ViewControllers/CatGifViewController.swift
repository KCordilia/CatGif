//
//  ViewController.swift
//  CatGif
//
//  Created by Karim Cordilia on 13/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import UIKit

class CatGifViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var activityIndictator: UIActivityIndicatorView = UIActivityIndicatorView()

    let catGifWebservice: CatGifWebservice = CatGifWebservice()
    var listWithGifData: [Data] = []
    private let numberOfGifs: Int = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Funny Cat Gifs"

        activityIndictator.center = self.view.center
        activityIndictator.hidesWhenStopped = true
        activityIndictator.style = UIActivityIndicatorView.Style.gray
        self.view.addSubview(activityIndictator)
        activityIndictator.startAnimating()
        
        configureEvents()
        loadData()
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        listWithGifData.removeAll()
        sender.endRefreshing()
        loadData()
        self.tableView.reloadData()
    }
}

private extension CatGifViewController {

    func loadData() {
        catGifWebservice.getData(with: numberOfGifs)
    }

    func configureEvents() {

        catGifWebservice.onDoneWithRetrievingData = {
            [weak self] data in

            self?.listWithGifData.append(data)

            if self?.listWithGifData.count == self?.numberOfGifs {
                self?.tableView.reloadData()
                self?.activityIndictator.stopAnimating()
            }
        }
    }
}

extension CatGifViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWithGifData.count

    }
}

extension CatGifViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatItem", for: indexPath)

        cell.imageView?.image = UIImage.gifImageWithData(data: self.listWithGifData[indexPath.row] as NSData)
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "CatGifDetail") as? CatGifDetailViewController {
            viewcontroller.selectedImage = listWithGifData[indexPath.row] as Data
            navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
}




