//
//  CollectionViewModel.swift
//  CollectionViewMVVM
//
//  Created by Anthony Guay on 5/27/21.
//

import Foundation
import UIKit

class CollectionViewModel {
	
	// Private variables
	private var items = [Item]()
	private var dataFetcher = DataFetcher()
	
	// Public variables
	let reuseIdentifier = "itemCell"
	let sectionInsets = UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 20.0)
	let numberOfItemsPerRow: Int = 3
	var numberOfRows: Int {
		return self.items.count
	}
	
	// MARK: Public functions
	
	// When the View loads, it asks ViewModel to start downloading the data. Completion Handler notifies the view to refresh itself and display Data.
	func startFetchingItems(completionHandler: @escaping () -> ()) {
		self.dataFetcher.getData { bool, items in
			self.items = items
			completionHandler()
		}
	}
	
	// Get Item for current IndexPath. (Items are displayed in order of left to right, top to bottom)
	func getCurrentItem(indexPath: IndexPath) -> Item? {
		let currentItemIndex = (indexPath.section * self.numberOfItemsPerRow) + indexPath.row
		var itemToReturn: Item?
		
		if (currentItemIndex < self.items.count){
			itemToReturn = self.items[currentItemIndex]
		}
		return itemToReturn
	}
	
}

