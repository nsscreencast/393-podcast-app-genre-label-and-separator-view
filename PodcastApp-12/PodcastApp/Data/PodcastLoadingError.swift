//
//  PodcastLoadingError.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 5/7/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import Foundation

enum PodcastLoadingError : Error {
    case networkingError(Error)
    case requestFailed(Int)
    case serverError(Int)
    case notFound
    case feedParsingError(Error)
    case missingAttribute(String)
}
