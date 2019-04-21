//
//  showMemories.swift
//  Zen Lounge
//
//  Created by user149408 on 4/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class showMemories: UIViewController {

    var name: String!
    var text: String!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       titleLabel.text = name
        textLabel.text = text
    }
    

  

}
