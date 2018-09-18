//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {

    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    var artist: Artist!
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: self.artist.albums)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = artist.name
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
}
