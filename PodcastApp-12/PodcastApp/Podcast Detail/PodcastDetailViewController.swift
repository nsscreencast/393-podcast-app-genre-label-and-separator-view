//
//  PodcastDetailViewController.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 5/14/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit

class PodcastDetailViewController : UITableViewController {
    var feedURL: URL! = URL(string: "http://feeds.gimletmedia.com/hearreplyall")!

    var podcast: Podcast! {
        didSet {
            headerViewController.podcast = podcast
        }
    }

    var headerViewController: PodcastDetailHeaderViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerViewController = children.compactMap { $0 as? PodcastDetailHeaderViewController }.first

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        PodcastFeedLoader().fetch(feed: feedURL) { result in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let podcast):
                self.podcast = podcast
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
