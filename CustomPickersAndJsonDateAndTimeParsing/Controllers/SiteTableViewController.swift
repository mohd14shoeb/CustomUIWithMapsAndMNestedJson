//
//  DemoTableViewController.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//


import UIKit
import expanding_collection

class SiteTableViewController: ExpandingTableViewController {

    // MARK: Properties
    
    fileprivate var scrollOffsetY: CGFloat = 0
   
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
    }
}

// MARK: Helpers

extension SiteTableViewController {

    fileprivate func configureNavBar() {
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem?.image = navigationItem.rightBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}

// MARK: Actions

extension SiteTableViewController {

    @IBAction func backButtonHandler(_: AnyObject) {
        // buttonAnimation
        let viewControllers: [SiteController?] = navigationController?.viewControllers.map { $0 as? SiteController } ?? []

        for viewController in viewControllers {
            if let rightButton = viewController?.navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(false)
            }
        }
        popTransitionAnimation()
    }
}

// MARK: UIScrollViewDelegate

extension SiteTableViewController {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -25 , let navigationController = navigationController {
            // buttonAnimation
            for case let viewController as SiteController in navigationController.viewControllers {
                if case let rightButton as AnimatingBarButton = viewController.navigationItem.rightBarButtonItem {
                    rightButton.animationSelected(false)
                }
            }
            popTransitionAnimation()
        }
        scrollOffsetY = scrollView.contentOffset.y
    }
}
