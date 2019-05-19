//
//  ViewController.swift
//  slideMenuClosure
//
//  Created by Vu on 5/13/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

enum SegueIdentifier : String {
    case home = "home"
    case slide = "slide"
}
class ContainerViewController: UIViewController, Slide {
    @IBOutlet weak var homeContainer: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leadingContainer: NSLayoutConstraint!
    @IBOutlet weak var backmenu: UIButton!
    
  
    
    var showing = false {
        didSet {
            UIView.animate(withDuration: 0.35) {
                self.leadingContainer.constant = self.showing ? +self.containerView.bounds.width : 0
                self.backmenu.alpha = self.showing ? 1 : 0
                self.view.layoutIfNeeded()
            }}
    }
    
    var homeVc: HomeViewController?
    var slideVc: SlideMenuViewController?
    
    
    var homeViewController = HomeViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showing = false
//        self.leadingContainer.constant = self.showing ? 0 : -self.containerView.bounds.width
        self.view.layoutIfNeeded()
        slideVc?.myClosure = homeVc?.fillData

    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Home":
            guard let navController = segue.destination as? UINavigationController else {return}
            homeVc = navController.topViewController as? HomeViewController
            homeVc!.delegate = self
        case "slide":
            slideVc = segue.destination as? SlideMenuViewController
            // gioi thieu cho nhau
            slideVc?.myColosureA = self
        default:
            return
        }
        
    }
    
    
    
    
    @IBAction func backMenu(_ sender: UIButton) {
        showing = !showing
    }
    
}

