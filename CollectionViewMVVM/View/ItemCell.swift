//
//  ItemCell.swift
//  CollectionViewMVVM
//
//  Created by Anthony Guay on 5/27/21.
//

import UIKit

class ItemCell: UICollectionViewCell {
	
	// Views outlets
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var soldOutImage: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var productNameLabel: UILabel!
	@IBOutlet weak var soldOutImageLayoutWidth: NSLayoutConstraint!
	@IBOutlet weak var soldOutImageLayoutHeight: NSLayoutConstraint!
	
	// Takes as parameter the Item to display and configures the Cell according to specifications
	func setupWithItem(_ item: Item) {
		
		// AutoLayout constraint for the SoldOut Image
		self.soldOutImageLayoutWidth.constant = (self.layer.frame.width/2)-4
		self.soldOutImageLayoutHeight.constant = (self.layer.frame.width/2)-4
		
		// Item Name
		self.productNameLabel.text = item.name
		self.productNameLabel.font = .systemFont(ofSize: 16)
		
		// Price label Style
		self.priceLabel.backgroundColor = .darkGray
		self.priceLabel.layer.cornerRadius = 6
		self.priceLabel.layer.masksToBounds = true
		self.priceLabel.textColor = .white
		self.priceLabel.font = .systemFont(ofSize: 13)
		
		// Price label Text
		if let price = item.price {
			self.priceLabel.text = " $\(price) "
		} else {
			self.priceLabel.text = ""
		}
		
		// Images Style
		self.mainImage.layer.masksToBounds = true
		self.mainImage.layer.cornerRadius = 8
		
		// Download Main image asynchronously
		self.mainImage.sd_setImage(with: URL(string: item.photo ?? ""), placeholderImage: nil)
		
		// Sold image
		if (item.status == .sold_out){
			self.soldOutImage.image = UIImage(named: "sold")
		} else {
			self.soldOutImage.image = nil
		}
	}
	
}
