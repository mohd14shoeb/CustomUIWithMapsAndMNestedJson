//
//  DemoViewController.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import UIKit
import expanding_collection

class SiteController: ExpandingViewController {

    // MARK: Properties
    
    var sites = [Sites]()
    fileprivate var cellsIsOpen = [Bool]()
    @IBOutlet var pageLabel: UILabel!
}

// MARK: - Lifecycle

extension SiteController {

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadNearBySites()
        registerCell()
        fillCellIsOpenArray()
        addGesture(to: collectionView!)
        configureNavBar()
    }
    
    // MARK: Functions
    
    func downloadNearBySites() {
        SiteServices.getSitesNearBy() { (result) in
            if let error = result as? UIAlertController {
                self.present(error,animated: true, completion: nil)
            } else if let site = result as? Sites {
                self.sites = [site]
            }
        }
    }
}

// MARK: Helpers

extension SiteController {

    fileprivate func registerCell() {

        let nib = UINib(nibName: String(describing: DemoCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: DemoCollectionViewCell.self))
    }

    fileprivate func fillCellIsOpenArray() {
        cellsIsOpen = Array(repeating: false, count: DataManager.shared.sitesDataManager.count)
    }

    fileprivate func getViewController() -> ExpandingTableViewController {
        let storyboard = UIStoryboard(storyboard: .Main)
        let toViewController: SiteTableViewController = storyboard.instantiateViewController()
        return toViewController
    }

    fileprivate func configureNavBar() {
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}

/// MARK: Gesture

extension SiteController {

    fileprivate func addGesture(to view: UIView) {
        let upGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(SiteController.swipeHandler(_:)))) {
            $0.direction = .up
        }

        let downGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(SiteController.swipeHandler(_:)))) {
            $0.direction = .down
        }
        view.addGestureRecognizer(upGesture)
        view.addGestureRecognizer(downGesture)
    }

    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        let indexPath = IndexPath(row: currentIndex, section: 0)
        guard let cell = collectionView?.cellForItem(at: indexPath) as? DemoCollectionViewCell else { return }
        // double swipe Up transition
        if cell.isOpened == true && sender.direction == .up {
            pushToViewController(getViewController())
            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(true)
            }
        }
        let open = sender.direction == .up ? true : false
        cell.cellIsOpen(open)
        cellsIsOpen[indexPath.row] = cell.isOpened
    }
}

// MARK: UIScrollViewDelegate

extension SiteController {

    func scrollViewDidScroll(_: UIScrollView) {
        pageLabel.text = "\(currentIndex + 1)/\(DataManager.shared.sitesDataManager.count)"
    }
}

// MARK: UICollectionViewDataSource

extension SiteController {

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? DemoCollectionViewCell else { return }

       let index = indexPath.row % DataManager.shared.sitesDataManager.count
        cell.adressLbl.text = DataManager.shared.sitesDataManager[index].adressLine1 + "," + DataManager.shared.sitesDataManager[index].postal + "," + DataManager.shared.sitesDataManager[index].city + "," + DataManager.shared.sitesDataManager[index].state
        cell.userDistanceLbl.text = "\(DataManager.shared.sitesDataManager[index].userDistance)"
        cell.customTitle.text = DataManager.shared.sitesDataManager[index].siteName
        cell.cellIsOpen(cellsIsOpen[index], animated: false)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DemoCollectionViewCell
            , currentIndex == indexPath.row else { return }

        if cell.isOpened == false {
            cell.cellIsOpen(true)
        } else {
            pushToViewController(getViewController())

            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(true)
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension SiteController {

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return DataManager.shared.sitesDataManager.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DemoCollectionViewCell.self), for: indexPath)
    }
}
