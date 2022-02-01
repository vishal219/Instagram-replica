//
//  ExploreViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let searchBar : UISearchBar = {
       let bar = UISearchBar()
        bar.backgroundColor = .secondarySystemBackground
        return bar
    }()

    private var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Assign frames
        
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
