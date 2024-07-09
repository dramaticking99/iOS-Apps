//
//  ViewController.swift
//  BlackOffer.assingment
//
//  Created by Chetan Sanwariya on 08/04/24.
//

import UIKit

class ExploreCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, menuSelectionDelegate {
    
    func didSelect(item: Int) {
        let indexPath = IndexPath(item: item, section: 0)
        collectionView.scrollToItem(at:indexPath , at: .centeredHorizontally, animated: true)
    }
    
    var menuView : UIView?
    let menuController = MenuViewController(collectionViewLayout: UICollectionViewFlowLayout())
    let cellColors : [UIColor] = [UIColor.red, UIColor.blue, UIColor.green]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuController.menuSelectionDelegate = self
        
        setUpNavigationBar()
        
        collectionView.isPagingEnabled = true
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        
        collectionView.register(DefaultCell.self, forCellWithReuseIdentifier: "DefaultCollectionViewCell")
        collectionView.register(MainViewController.self, forCellWithReuseIdentifier: MainViewController.identifier)
        
        setUpMenuView()
        
        
    }
    
    
    //MARK: - Collection View DataSource Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewController.identifier,
                                                      for: indexPath) as! MainViewController
        return cell
    }
    
    
    //MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height : CGFloat =  collectionView.frame.height -  view.safeAreaInsets.bottom
        let width : CGFloat = view.frame.width
        return CGSize(width: width, height: height)
    }
    
    
    
    //MARK: - Function setting up the menu bar
    func setUpMenuView() {
        if let menuLayout = menuController.collectionViewLayout as? UICollectionViewFlowLayout {
            menuLayout.scrollDirection = .horizontal
            menuLayout.minimumLineSpacing = 0
            menuLayout.minimumInteritemSpacing = 0
        }
        
        let menuView = menuController.view!
        menuView.backgroundColor = .white
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuView)
        
        
        let menuViewConstraints = [
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 44),
            menuView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(menuViewConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)

    }
    
    //MARK: - Setting up the naviagtion bar
    
    func setUpNavigationBar() {
        // Create a custom view for the title
        let customTitleView = UIView()
        
        // Create a title label
        let titleLabel = UILabel()
        titleLabel.text = " ◎ Explore Screen"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.sizeToFit()
        
        // Position the title label to the left within the custom view
        titleLabel.frame.origin.x = -200
        titleLabel.frame.origin.y = -10
        
        // Add the title label to the custom view
        customTitleView.addSubview(titleLabel)
        
        // Assign the custom view as the title view of the navigation item
        navigationItem.titleView = customTitleView
    }
    
    //MARK: - Handling the animation and function of menu bar(ScrollView delegate methods)
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x/3
        menuController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0 )
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let item = x / view.frame.width
        let indexPath = IndexPath(item: Int(item), section: 0)
        menuController.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
}

