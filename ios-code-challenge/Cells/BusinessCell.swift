//
//  NXTBusinessTableViewCell.swift
//  ios-code-challenge
//
//  Created by Trevor Steele on 9/2/21.
//  Copyright © 2021 Dustin Lange. All rights reserved.
//

import Foundation

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configureCell(_ business: YLPBusiness) {
        nameLabel.text = business.name
        ratingLabel.text = "Rating: \(String(describing: business.rating))/5"
        categoriesLabel.text = business.categories
        reviewCountLabel.text = "\(business.reviewCount.description) reviews"
        distanceLabel.text = "Distance: \(business.distance.rounded().description) meters"
        downloadThumbnail(url: business.thumbnailURL) { [weak self] image in
            guard let weakSelf = self else {return}
            DispatchQueue.main.async {
                weakSelf.thumbnailImageView.image = image
            }
        }
    }
    
    func downloadThumbnail(url: String, onCompletion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            guard error == nil else { return }
            onCompletion(UIImage(data: data!)!)
        }.resume()
    }
    
    override func prepareForReuse() {
        DispatchQueue.main.async {
            self.thumbnailImageView.image = nil
        }
        super.prepareForReuse()
    }
}



extension BusinessCell: NXTBindingDataForObjectDelegate {
    func bindingData(for object: Any!) {
        self.configureCell(object as! YLPBusiness)
    }
}

