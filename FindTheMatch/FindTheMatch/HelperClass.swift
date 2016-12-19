//
//  HelperClass.swift
//  FindTheMatch
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import UIKit

class HelperClass
{
    static func parselocalJson() -> [WordEqualModel]
    {
        var wordModels = [WordEqualModel]()
        do{
            if let path = Bundle.main.path(forResource: "words", ofType: "json")
            {
                if let jsonData = try String(contentsOfFile: path).data(using: .utf8)
                {
                    if let wordArray =  try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [Any]
                    {
                        var wordModel:WordEqualModel
                        for dictWord in wordArray
                        {
                            wordModel = WordEqualModel(dict: dictWord as! [String:String])
                            wordModels.append(wordModel)
                        }
                    }
                }
            }
            
        }
        catch
        {
            //do nothing
            print(error)
        }
        
        
        return wordModels
        
    }
    
    
    static func getRandomNumbers(from inputArray:[WordEqualModel],count:Int) -> [WordEqualModel]
    {
        var index:Int = 0
        var resultArray:[WordEqualModel] = [WordEqualModel]()
        for _ in 0  ..< count
        {
            index = Int(arc4random_uniform(UInt32(inputArray.count)))
            resultArray.append(inputArray[index])
        }
        return resultArray
    }

}
