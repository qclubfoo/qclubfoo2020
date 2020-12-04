//
//  ArticleManager.swift
//  qclubfoo2020
//
//  Created by Дмитрий on 04.12.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation
import CoreData

public protocol IArticleManager: class {
    func getAllArticles() -> [Article]?
    func getArticles(withLang lang: String) -> [Article]?
    func getArticles(containingString str: String) -> [Article]?
    func removeArticle(article: Article)
    func save()
    
}

public class ArticleManager: IArticleManager {
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "article")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("something went wrong \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    public lazy var context = {
        self.container.viewContext
    }
    
    public func getAllArticles() -> [Article]? {
        let context = container.viewContext
        let request = Article.createFetchRequest()
        do {
            let articles = try context.fetch(request)
            return articles
        } catch {
            print("something goes wrong\n\(error.localizedDescription)")
        }
        return nil
    }
    
    public func getArticles(withLang lang: String) -> [Article]? {
        let context = container.viewContext
        let predicate = NSPredicate(format: "language == %@", lang)
        let request = Article.createFetchRequest()
        request.predicate = predicate
        do {
            let articles = try context.fetch(request)
            return articles
        } catch {
            print("something goes wrong\n\(error.localizedDescription)")
        }
        return nil
    }
    
    public func getArticles(containingString str: String) -> [Article]? {
        let context = container.viewContext
        let predicate = NSPredicate(format: "content CONTAINS[c] %@", str)
        let request = Article.createFetchRequest()
        request.predicate = predicate
        do {
            let articles = try context.fetch(request)
            return articles
        } catch {
            print("something goes wrong\n\(error.localizedDescription)")
        }
        return nil
    }
    
    public func removeArticle(article: Article) {
        let context = container.viewContext
        context.delete(article)
        save()
    }
    
    public func save() {
        let context = container.viewContext
        do {
            try context.save()
        } catch {
            print("can't save context.\nError \(error.localizedDescription)")
        }
    }
}
