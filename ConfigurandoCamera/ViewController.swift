//
//  ViewController.swift
//  ConfigurandoCamera
//
//  Created by Vitor Guilherme da Silva Costa on 07/02/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        self.addButton.layer.cornerRadius = 8
        self.addButton.clipsToBounds = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagemRecuperada:UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageUser.image = imagemRecuperada
        
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedAddImageButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker,animated: true, completion: nil)
        }
    }
}

