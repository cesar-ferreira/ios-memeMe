//
//  MyCollectionViewController.swift
//  ios-memeMe
//
//  Created by César Ferreira on 17/03/21.
//  Copyright © 2021 César Ferreira. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!

    var memes: [Meme]? {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupLayout()

        myCollectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)

        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        myCollectionView.reloadData()
    }

    private func setupLayout() {
        let space:CGFloat = 12.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0

        layout.itemSize = CGSize(width: dimension, height: dimension)
        myCollectionView.collectionViewLayout = layout
    }

    @objc func addTapped() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }

    private func showEmptyView(isVisible: Bool) {
        myCollectionView.isHidden = isVisible
        emptyView.isHidden = !isVisible    }

}

extension MyCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let meme = memes?[indexPath.row]

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MemeDetailsViewController") as! MemeDetailsViewController
        newViewController.image = meme!.memedImage

        self.present(newViewController, animated: true, completion: nil)
    }
}

extension MyCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.showEmptyView(isVisible: (memes?.count ?? 0 == 0))
        return memes?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        // Configure the cell

        cell.backgroundColor = .black
        cell.configureCollectionCell(with: (memes?[indexPath.row].memedImage)!)

        return cell
    }
}
