//
//  ItunesAPI.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 21/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation

enum ItunesAPI {
    case search(term: String, media: ItunesMedia?)
}

extension ItunesAPI: Endpoint {
    var base: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term, let media):
            var result = [URLQueryItem]()
            
            let searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)
                result.append(mediaItem)
            }
            
            return result
        }
    }
}
