//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    private let songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier, for: indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let vm = SongViewModel(song: song)
        
        cell.songNameLabel.text = vm.title
        cell.songDurationLabel.text = vm.runtime
        
        return cell
    }
    
    // MARK: Table view Delegate
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Tracks"
        default: return nil
        }
    }
}
