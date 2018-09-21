//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 21/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation

protocol  QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
