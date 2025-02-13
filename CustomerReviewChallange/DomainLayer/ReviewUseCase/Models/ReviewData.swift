//
//  ReviewData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

// MARK: - ReviewResponse
public class ReviewData: CodableDataProtocol {
    let feed: Feed?

    init(feed: Feed?) {
        self.feed = feed
    }
    
}

// MARK: - Feed
public class Feed: Codable {
    let author: FeedAuthor?
    let entry: [Entry]?
    let updated, rights, title, icon: Icon?
    let link: [LinkElement]?
    let id: Icon?

    init(author: FeedAuthor?, entry: [Entry]?, updated: Icon?, rights: Icon?, title: Icon?, icon: Icon?, link: [LinkElement]?, id: Icon?) {
        self.author = author
        self.entry = entry
        self.updated = updated
        self.rights = rights
        self.title = title
        self.icon = icon
        self.link = link
        self.id = id
    }
}

// MARK: - FeedAuthor
public class FeedAuthor: Codable {
    let name, uri: Icon?

    init(name: Icon?, uri: Icon?) {
        self.name = name
        self.uri = uri
    }
}

// MARK: - Icon
public class Icon: Codable {
    let label: String?

    init(label: String?) {
        self.label = label
    }
}

// MARK: - Entry
public class Entry: Codable {
    let author: EntryAuthor?
    let imVersion, imRating, id, title: Icon?
    let content: Content?
    let link: EntryLink?
    let imVoteSum: Icon?
    let imContentType: IMContentType?
    let imVoteCount: Icon?

    enum CodingKeys: String, CodingKey {
        case author
        case imVersion = "im:version"
        case imRating = "im:rating"
        case id, title, content, link
        case imVoteSum = "im:voteSum"
        case imContentType = "im:contentType"
        case imVoteCount = "im:voteCount"
    }

    init(author: EntryAuthor?, imVersion: Icon?, imRating: Icon?, id: Icon?, title: Icon?, content: Content?, link: EntryLink?, imVoteSum: Icon?, imContentType: IMContentType?, imVoteCount: Icon?) {
        self.author = author
        self.imVersion = imVersion
        self.imRating = imRating
        self.id = id
        self.title = title
        self.content = content
        self.link = link
        self.imVoteSum = imVoteSum
        self.imContentType = imContentType
        self.imVoteCount = imVoteCount
    }
}

// MARK: - EntryAuthor
public class EntryAuthor: Codable {
    let uri, name: Icon?
    let label: String?

    init(uri: Icon?, name: Icon?, label: String?) {
        self.uri = uri
        self.name = name
        self.label = label
    }
}

// MARK: - Content
public class Content: Codable {
    let label: String?
    let attributes: ContentAttributes?

    init(label: String?, attributes: ContentAttributes?) {
        self.label = label
        self.attributes = attributes
    }
}

// MARK: - ContentAttributes
public class ContentAttributes: Codable {
    let type: TypeEnum?

    init(type: TypeEnum?) {
        self.type = type
    }
}

public  enum TypeEnum: String, Codable {
    case text = "text"
}

// MARK: - IMContentType
public class IMContentType: Codable {
    let attributes: IMContentTypeAttributes?

    init(attributes: IMContentTypeAttributes?) {
        self.attributes = attributes
    }
}

// MARK: - IMContentTypeAttributes
public class IMContentTypeAttributes: Codable {
    let term: Term?
    let label: Label?

    init(term: Term?, label: Label?) {
        self.term = term
        self.label = label
    }
}

public enum Label: String, Codable {
    case programma = "Programma"
}

public enum Term: String, Codable {
    case application = "Application"
}

// MARK: - EntryLink
public class EntryLink: Codable {
    let attributes: PurpleAttributes?

    init(attributes: PurpleAttributes?) {
        self.attributes = attributes
    }
}

// MARK: - PurpleAttributes
public class PurpleAttributes: Codable {
    let rel: Rel?
    let href: String?

    init(rel: Rel?, href: String?) {
        self.rel = rel
        self.href = href
    }
}

public enum Rel: String, Codable {
    case related = "related"
}

// MARK: - LinkElement
public class LinkElement: Codable {
    let attributes: FluffyAttributes?

    init(attributes: FluffyAttributes?) {
        self.attributes = attributes
    }
}

// MARK: - FluffyAttributes
public class FluffyAttributes: Codable {
    let rel, type: String?
    let href: String?

    init(rel: String?, type: String?, href: String?) {
        self.rel = rel
        self.type = type
        self.href = href
    }
}
