//
//  CameraViewController.swift
//  instagram
//
//  Created by Eva Keeling on 2/26/22.
//

import UIKit
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
    }
    @IBAction func onCameraButton(_ sender: Any) {
        print("Calling Camera")
        let picker = UIImagePickerController()
        // when user is done taking photo call me back
        picker.delegate = self
        picker.allowsEditing = true
        
        // if camera is available or not perform different options
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            print("Camera.")
        } else {
            picker.sourceType = .photoLibrary
            print("Photo Library")
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        // To lower the amount of data we need to use when deploying
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
