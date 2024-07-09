//
//  MainViewController.swift
//  BlackOffer.assingment
//
//  Created by Chetan Sanwariya on 09/04/24.
//

import UIKit

class MainViewController: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "mainViewController"

    var tableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: contentView.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "listViewCell"  )
        contentView.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as! ListViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = contentView.bounds
    }
    
}
