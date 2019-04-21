//
//  ZenMemories.swift
//  Zen Lounge
//
//  Created by user149408 on 4/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class ZenMemories: UIViewController {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var textField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //Function for saving Title and Descrition in Memories-Stores it in CoreData
    @IBAction func saveData(_ sender: Any) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            
            let newMemories = Memories(context: appDelegate.persistentContainer.viewContext)
            newMemories.title = titleField.text ?? ""
            newMemories.text = textField.text ?? ""
            
            appDelegate.saveContext()
            
            
            }
    
    }
}
