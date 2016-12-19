//
//  WordEqualModel.swift
//  FindTheMatch
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import UIKit

class WordEqualModel
{
    var englishWord = ""
    var spanishWord = ""
    
    convenience init(dict:[String:String])
    {
        self.init()
        populateWord(dict: dict)
    }
    
    func populateWord(dict:[String:String])
    {
        englishWord = dict["text_eng"]!
        spanishWord = dict["text_spa"]! 
    }
}
