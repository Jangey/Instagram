//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by Jangey Lu on 9/22/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var previewImage: UIImageView!
    
    var resizedPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

    }
    
    
    @IBAction func takePicture(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            imagePicker.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
 
    }
    
   
    @IBAction func chooseFromLibaray(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        //previewImage.image = resize(image: imagePicker, newSize: CGSize(width: 30, height: 30))
        
        
    }
    
    @IBAction func tapShare(_ sender: Any) {
    }
    
    /*
    //resizeImage function
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        //let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        let resizeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIView.ContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            previewImage.image = resize(image: image, newSize: CGSize(width: 30, height: 30))
        }
        dismiss(animated: true, completion: nil)
    }
    */

}
