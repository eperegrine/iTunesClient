//
//  iTunesAPIClient.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 21/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtists(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = ItunesAPI.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        performRequest(with: endpoint) {
            results, error in
            guard let results = results else {
                completion([], error)
                return
            }
            
            let artists = results.compactMap{Artist(json: $0)}
            completion(artists, nil)
        }
    }
    
    func lookpArtist(withId id: Int, completion: @escaping (Artist?, ItunesError?) -> Void) {
        let endpoint = ItunesAPI.lookup(id: id, entity: MusicEntity.album )
        performRequest(with: endpoint) {
            results, error in
            guard let results = results else {
                completion(nil, error)
                return
            }
            
            let artists = results.compactMap{Artist(json: $0)}
            completion(artists, nil)
        }
    }
    
    func performRequest(with endpoint: Endpoint, completion: @escaping (Result?, ItunesError?) -> Void) {
        let task = downloader.jsonTask(with: endpoint.request) {
            json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let results = json["results"] as? [[String:Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                
                completion(results, nil)
            }
        }
    }
}
