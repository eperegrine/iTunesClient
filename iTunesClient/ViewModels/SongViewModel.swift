//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.runtime = "\(minutes): \(seconds)"
    }
}
