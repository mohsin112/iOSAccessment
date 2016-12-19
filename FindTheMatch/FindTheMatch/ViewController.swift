//
//  ViewController.swift
//  FindTheMatch
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
     let result =   parselocalJson()
    }
    
    private func parselocalJson() -> [WordEqualModel]
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
}

