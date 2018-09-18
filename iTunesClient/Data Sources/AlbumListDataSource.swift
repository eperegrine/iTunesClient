//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    private let albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
        super.init()
        
    }
    
    //MARK: Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as? AlbumCell else {
            fatalError("Failed to convert cell to AlbumCell")
        }
        let album = albums[indexPath.row]
        let albumViewModel = AlbumCellViewModel(album: album)
        albumCell.configure(with: albumViewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        return albumCell
    }
}
