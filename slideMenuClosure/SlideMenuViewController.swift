//
//  SlideMenuViewController.swift
//  slideMenuClosure
//
//  Created by Vu on 5/13/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit


class SlideMenuViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var photoSlide: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    // goi ham dong
    var myColosureA: Slide?
    var myClosure: ((_ data: Person?) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func passData(_ sender: Any) {
        let data = Person(image: photoSlide.image!, name: nameText.text!, age: ageText.text!)
       myClosure?(data)
        // khi truyen du lieu thi dong luon
      myColosureA?.showing = false
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    private func setupAvatarImage() {
        photoSlide.layer.cornerRadius = photoSlide.bounds.height / 2
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoSlide.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // Check các giá trị nhập vào menu cho theo yêu cầu như text phải có, image phải có....
    private func validationDateInput() -> Bool {
        guard let name = nameText.text, let age = ageText.text else {
            return false
        }
        
        if name.isEmpty || age.isEmpty {
            print("Mời nhập đầy đủ thông tin")
            return false
        }
        
        return true
    }
}
