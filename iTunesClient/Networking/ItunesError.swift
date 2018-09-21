//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 21/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
