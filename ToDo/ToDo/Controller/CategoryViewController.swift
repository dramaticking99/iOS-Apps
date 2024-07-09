//
//  TableViewController.swift
//  ToDo
//
//  Created by Chetan Sanwariya on 12/05/24.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArr : [Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        var category = categoryArr[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var category = categoryArr[indexPath.row]
        print(category.name!)
        
        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        
        
        if let toDoVC = storyboard?.instantiateViewController(withIdentifier: "ToDoListViewController") as? ToDoListViewController {
            toDoVC.category = category
            toDoVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(toDoVC, animated: true)
        }

    }

    @IBAction func AddButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "ADD CATEGORY",
                                      message: "type the Category you want to add",
                                      preferredStyle: .alert)
        
        var ItemtextField = UITextField()
        let action = UIAlertAction(title: "Add", style: .default) { uiAlertAction in
            
            //let newItem = Item(context: self.context)
            let newCategory = Category(context: self.context)
            newCategory.name = ItemtextField.text
            //newItem.text = ItemtextField.text!
            self.categoryArr.append(newCategory)
            self.saveData()
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { textField in
            textField.placeholder = "add Category here"
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
    
    func getData(with request : NSFetchRequest<Category> = Category.fetchRequest()) {
        //get Data
        do {
            self.categoryArr = try context.fetch(request)
        } catch {
            print("Error fetching the Categories")
        }
        
    }
}
