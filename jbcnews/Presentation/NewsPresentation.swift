//
//  NewsPresentation.swift
//  jbcnews
//
//  Created by cagla copuroglu on 11.11.2022.
//

import Foundation
import NewsKit

final class NewsPresentation: NSObject {

    let title: String
    let detail: String

    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? NewsPresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}

extension NewsPresentation {

    convenience init(news: Datum) {
        self.init(title: news.title ?? "title",
                  detail: news.datumDescription ?? "datum desc")
    }
}
