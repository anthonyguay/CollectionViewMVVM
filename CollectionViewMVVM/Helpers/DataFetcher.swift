//
//  DataFetcher.swift
//  CollectionViewMVVM
//
//  Created by Anthony Guay on 5/27/21.
//

import Foundation

struct DataFetcher {
	
	let usePrivateFileOverNetwork = true
	
	// MARK: Public function
	
	// Public method for ViewModel to get data, regardless of whether it's from a Server or Local file
	func getData(completionHandler: @escaping(_ done: Bool, _ items: [Item]) -> ()) {
		if (usePrivateFileOverNetwork){
			// Read local JSON file, parse it into Model, and return
			if let jsonDataFromLocalFile = self.readLocalFile() {
				if let items = self.parseJson(jsonDataFromLocalFile) {
					completionHandler(true, items)
				}
			}
		} else {
			/*
			// ## This module is ready to query JSON data from a server ##
			
			// Query JSON over Network, parse response into Model, and return
			
			self.getDataFromNetwork { success, jsonData in
			if (success) {
			if let items = self.parseJson(jsonData!) {
			completionHandler(true, items)
			}
			} else {
			// Network error, no data returned
			}
			}
			*/
		}
	}
	
	// MARK: Private functions
	
	// Reads JSON file included in the project
	private func readLocalFile() -> Data? {
		if let bundle = Bundle.main.path(forResource: "all", ofType: "json") {
			if let jsonData = try? String(contentsOfFile: bundle).data(using: .utf8) {
				return jsonData
			}
		} else {
			// Error, handle gracefully
		}
		return nil
	}
	
	// Parses JSON object into the Model [Item]
	private func parseJson(_ json: Data) -> [Item]? {
		if let jsonPetitions = try? JSONDecoder().decode(Items.self, from: json) {
			return jsonPetitions.data
		} else {
			// Error, handle gracefully
			return nil
		}
	}
	
	
	
	
	/*
	//	## This module is ready to query JSON data from a server ##
	
	// This module could speak to a NetworkManager to query a JSON response from any server
	private func getDataFromNetwork(completionHandler: @escaping (_ successStatus: Bool, _ jsonData: Data?) -> ()) {
	let serverUrl = ""
	var urlComponent = URLComponents(string: serverUrl)!
	//		urlComponent.queryItems = [URLQueryItem(name: "parameterName", value: parameterValue)]
	
	var request = URLRequest(url: urlComponent.url!)
	request.httpMethod = "GET"
	
	URLSession.shared.dataTask(with: request) {data, response, error in
	if (error == nil) {
	completionHandler(true, data)
	} else {
	completionHandler(false, data)
	}
	}.resume()
	}
	*/
	
}
