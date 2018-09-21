//
//  ViewController.swift
//  iTunesClient
//
//  Created by Emily Peregrine on 18/09/2018.
//  Copyright © 2018 Emily Peregrine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let artistMedia = ItunesMedia.music(entity: MusicEntity.musicArtist, attribute: MusicAttribute.artistTerm)
        let searchEndpoint = ItunesAPI.search(term: "taylor swift", media: artistMedia)
        
        let lookupEndpoint = ItunesAPI.lookup(id: 159260351, entity: MusicEntity.album)
        
        print ("Search: ", searchEndpoint.request)
        print("***********************************")
        print("Lookup: ", lookupEndpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

