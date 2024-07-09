//
//  MenuViewController.swift
//  BlackOffer.assingment
//
//  Created by Chetan Sanwariya on 08/04/24.
//

import UIKit

protocol menuSelectionDelegate : AnyObject {
    func didSelect(item : Int)
}


class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    weak var menuSelectionDelegate : menuSelectionDelegate?
    
    static let identifier = "menuViewCell"
    let menuItems : [String] = ["Personal","Services","Businesses"]
    
    let menuBar : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "MenuCell", bundle: nil),
                                forCellWithReuseIdentifier: "menuCell")
        
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            menuBar.heightAnchor.constraint(equalToConstant: 5),
            menuBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    

//MARK: - CollectionView DataSource Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.menuItemLable.text = menuItems[indexPath.item]
        return cell
    }

//MARK: - Collecton View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width/3, height: 44)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        menuSelectionDelegate?.didSelect(item: indexPath.item)
    }
    
}
