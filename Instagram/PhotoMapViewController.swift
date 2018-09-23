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

        self.present(imagePicker, animated: true, completion: nil)
 
    }
    
   
    @IBAction func chooseFromLibaray(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    /*
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            postPhoto.image = resize(image: image, newSize: CGSize(width: 30, height: 30))
        }
        dismiss(animated: true, completion: nil)
    }
    */
    

}
