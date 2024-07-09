//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Chetan Sanwariya on 09/02/24.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource {
    
    var messages:[MessageModel] = [MessageModel(body: "hello", sender: "user"),
                                   MessageModel(body: "hi", sender: "user"),
                                   MessageModel(body: "helloWorld", sender: "user")]
                                   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReusableCell" , for: indexPath)
        var messageBody = messages[indexPath.row].body
        cell.textLabel?.text = messageBody
        return cell
    }
    


}
