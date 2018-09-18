//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {

    var album: Album?
    
    lazy var dataSource: AlbumDetailDataSource = {
        return AlbumDetailDataSource(songs: self.album!.songs)
    }()
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: album!)
        tableView.dataSource = dataSource
    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        //TODO: Add implemntation for artwork view
        albumTitleLabel.text = viewModel.tile
        albumGenreLabel.text = viewModel.genre
        albumDateLabel.text = viewModel.releaseDate
    }
    

}
