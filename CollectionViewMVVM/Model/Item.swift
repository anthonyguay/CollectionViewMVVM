//
//  Item.swift
//  CollectionViewMVVM
//
//  Created by Anthony Guay on 5/27/21.
//

import Foundation

enum Status: String, Codable {
	case on_sale
	case sold_out
}

struct Item: Codable {
	var id: String?
	var name: String?
	var status: Status?
	var numLikes: Int?
	var numComments: Int?
	var price: Int?
	var photo: String?
}

// Creating a new Struct here to copy the JSON response format, in order to parse automatically. "Items" object = "data" array in JSON = [Item]
struct Items: Codable {
	var data: [Item]
}
