//
//  ViewController.swift
//  qclubfoo2020Examples
//
//  Created by Дмитрий on 04.12.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import CoreData
import qclubfoo2020

class ViewController: UIViewController {
    
    let manager: IArticleManager = ArticleManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        printAllArticles()
        addThreeArticle()
        printAllArticles()
        // Do any additional setup after loading the view.
    }
    
    private func addThreeArticle() {
        let context = manager.context
        
        for _ in 1...3 {
            _ = Article(title: "Note",
                    content: "This is awesom note",
                    language: "Russian",
                    image: "imageURL",
                    creationDate: Date(),
                    modificationDate: Date(),
                    context: context)
        }
        manager.save()
    }
    
    private func printAllArticles() {
        if let articles = manager.getAllArticles(),
            !articles.isEmpty {
            print("There are \(articles.count) in CoreData")
            for article in articles {
                print(article.description)
            }
        } else {
            print("nothing to print")
        }
        
    }


}

