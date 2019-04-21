//
//  MemoriesNew.swift
//  Zen Lounge
//
//  Created by user149408 on 4/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class MemoriesNew: UITableViewController, NSFetchedResultsControllerDelegate {

    var memoriesArray : [Memories] = []
    var fetchResultController : NSFetchedResultsController<Memories>!
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //Funtion for at fetch saved data from CoreData
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest: NSFetchRequest<Memories> = Memories.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    memoriesArray = fetchedObjects
                   tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
    //Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoriesArray.count
    }
    //Enables cells to display title
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MemoriesCell
        let row = indexPath.row
        let cellData = memoriesArray[row]
        cell.titleLabel?.text = cellData.title
        return cell
    }
    //Delete funtion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                context.delete(memoriesArray[indexPath.row])
                appDelegate.saveContext()
                
                memoriesArray.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
    //For selected row-memorie
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        selectedRow = row
        performSegue(withIdentifier: "showMemory", sender: row)
    }
    //Opens memorie in new page and dispays it
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMemory" {
            if let viewMemory = segue.destination as? showMemories {
                viewMemory.name = memoriesArray[selectedRow].title
                viewMemory.text = memoriesArray[selectedRow].text
                
            }
        }
    }
}
