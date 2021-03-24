//
//  MyTableViewController.swift
//  ios-memeMe
//
//  Created by César Ferreira on 16/03/21.
//  Copyright © 2021 César Ferreira. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!

    var memes: [Meme]? {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.tableFooterView = UIView()
        setupNavigationBar()

        myTableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.reuseIdentifier)

        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
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
        myTableView.isHidden = isVisible
        emptyView.isHidden = !isVisible
    }
}

extension MyTableViewController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        self.showEmptyView(isVisible: (memes?.count ?? 0 == 0))
        return memes?.count ?? 0
    }

}

extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseIdentifier, for: indexPath) as! MyTableViewCell

        let meme = memes?[indexPath.row]

        cell.memedImage.image = (meme?.memedImage)!
        cell.topLabel.text = meme?.bottomText
        cell.bottomLabel.text = meme?.bottomText

        return cell
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
