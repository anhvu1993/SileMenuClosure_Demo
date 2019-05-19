//
//  HomeViewController.swift
//  slideMenuClosure
//
//  Created by Vu on 5/13/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

protocol Slide {
    var showing: Bool {get set}
}
class HomeViewController: UIViewController {

    @IBOutlet weak var photoHome: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    
    var delegate: Slide?
    func fillData(_ data: Person?) {
       photoHome.image = data?.image
        nameLbl.text = data?.name
        ageLbl.text = data?.age
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickMenu(_ sender: Any) {
        delegate?.showing = true
    }
    

}
