//
//  Article+CoreDataProperties.swift
//  qclubfoo2020
//
//  Created by Дмитрий on 04.12.2020.
//  Copyright © 2020 home. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var modificationDate: Date?

    convenience init(title: String, content: String, language: String, image: String, creationDate: Date, modificationDate: Date, context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.content = content
        self.language = language
        self.image = image
        self.creationDate = creationDate
        self.modificationDate = modificationDate
    }
    
}
