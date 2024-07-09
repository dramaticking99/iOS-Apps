//
//  ViewController.swift
//  ToDo
//
//  Created by Chetan Sanwariya on 24/03/24.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var category : Category?
    
    var ToDoItems : [Item] = []
    
    let defaults = UserDefaults.standard
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory,
                                                in: .userDomainMask).first!.appendingPathComponent("items.plist",
                                                                                                   conformingTo: .data)
    
    override func viewDidLoad() {
        
        searchBar.delegate = self
        
        super.viewDidLoad()
        print(dataFilePath)
        
        navigationItem.title = category?.name
        
        getData()
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = ToDoItems[indexPath.row].text
        
        let item = ToDoItems[indexPath.row]
        
        if (item.done == true) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//                context.delete(ToDoItems[indexPath.row])
//                ToDoItems.remove(at: indexPath.row)
        
        var item = ToDoItems[indexPath.row]
        item.done = item.done ? false : true
        saveData()
        tableView.reloadData()
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "ADD ITEM",
                                      message: "type the item you want to add",
                                      preferredStyle: .alert)
        
        var ItemtextField = UITextField()
        let action = UIAlertAction(title: "Add", style: .default) { uiAlertAction in
            
            let newItem = Item(context: self.context)
            newItem.text = ItemtextField.text!
            newItem.parentCategory = self.category!
            self.ToDoItems.append(newItem)
            self.saveData()
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { textField in
            textField.placeholder = "add item here"
            ItemtextField = textField
        }
        
        present(alert, animated: true)
    }
    
    func saveData() {
        //save the data
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func getData(with request : NSFetchRequest<Item> = Item.fetchRequest()) {
        //get Data
        do {
            let DummyArr = try context.fetch(request)
            
            for item in DummyArr {
                if item.parentCategory == category {
                    ToDoItems.append(item)
                }
            }
            
        } catch {
            print("Error fetching the Items")
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        request.predicate = NSPredicate(format: "Item.text CONTAINS[cd] %@", searchBar.text!)
        
        getData(with: request)
        
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("in the cancel buttin function")
    }
    
}

//extension ToDoListViewController : UISearchBarDelegate {
//    
//    
//    
//    
//    
////    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
////        
////        print("in the search function")
////        
////        if let searchString = searchBar.text {
////            print(searchString)
////        }
////        
////        
////        
////        let request : NSFetchRequest<Item> = Item.fetchRequest()
////        
////        let predicate = NSPredicate(format: "Item.text CONTAINS[cd] %@", searchBar.text!)
////            print("the predicate is generated")
////        
////        request.predicate = predicate
////        
////        do {
////            self.ToDoItems = try context.fetch(request)
////        } catch {
////            print("Error fetching the Items")
////        }
////        
////        tableView.reloadData()
////        
////    }
//}

