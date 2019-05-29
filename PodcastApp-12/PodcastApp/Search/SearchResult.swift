//
//  SearchResult.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 3/7/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit

class SearchResult {
    var artworkUrl: URL?
    var title: String
    var author: String

    init(artworkUrl: URL?, title: String, author: String) {
        self.artworkUrl = artworkUrl
        self.title = title
        self.author = author
    }
}

extension SearchResult {
    convenience init(podcastResult: TopPodcastsAPI.PodcastResult) {
        self.init(
            artworkUrl: URL(string: podcastResult.artworkUrl100),
            title: podcastResult.name,
            author: podcastResult.artistName)
    }
}

extension SearchResult {
    convenience init(searchResult: PodcastSearchAPI.PodcastSearchResult) {
        self.init(
            artworkUrl: URL(string: searchResult.artworkUrl100),
            title: searchResult.collectionName,
            author: searchResult.artistName)
    }
}
