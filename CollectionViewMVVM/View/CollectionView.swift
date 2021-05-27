//
//  CollectionView.swift
//  CollectionViewMVVM
//
//  Created by Anthony Guay on 5/27/21.
//

import UIKit
import SDWebImage

class CollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	private var viewModel: CollectionViewModel = CollectionViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.collectionView!.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: self.viewModel.reuseIdentifier)
		
		// Ask the ViewModel for Data to Display. Refresh UI when the ViewModel actually returns the data to display
		self.viewModel.startFetchingItems {
			self.collectionView.reloadData()
		}
	}
	
	// MARK: UICollectionViewDataSource
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewModel.numberOfRows
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.viewModel.reuseIdentifier, for: indexPath) as! ItemCell
		
		// Configure cell with corresponding item for current row and section (indexPath)
		if let itemToDisplay = self.viewModel.getCurrentItem(indexPath: indexPath) {
			cell.setupWithItem(itemToDisplay)
		}
		
		return cell
	}
	
	// MARK: - UICollectionViewDelegateFlowLayout
	
	// Configure the Cell size
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let paddingSpace = self.viewModel.sectionInsets.left * CGFloat(self.viewModel.numberOfItemsPerRow + 1)
		let availableWidth = view.frame.width - paddingSpace
		let widthPerItem = availableWidth / CGFloat(self.viewModel.numberOfItemsPerRow)
		return CGSize(width: widthPerItem, height: widthPerItem+40)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return self.viewModel.sectionInsets
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
}
