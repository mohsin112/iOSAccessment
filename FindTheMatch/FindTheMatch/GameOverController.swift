//
//  GameOverController.swift
//  FindTheMatch
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import UIKit

class GameOverController: UIViewController {
  
    var playerWon:String = ""
    @IBOutlet var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.text = playerWon
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func continueBtn(_ sender: Any) {
        let _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
}
