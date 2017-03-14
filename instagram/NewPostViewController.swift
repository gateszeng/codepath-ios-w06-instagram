//
//  NewPostViewController.swift
//  instagram
//
//  Created by Gates Zeng on 3/13/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit
import AFNetworking

class NewPostViewController: UIViewController {
    @IBOutlet weak var selectView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSelectView(sender:)))
        self.selectView.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onPostButton(_ sender: Any) {
        ParseClient.postImage(image: selectedImage, withCaption: captionField.text) { (done: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("image uploaded")
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func didTapSelectView(sender: UITapGestureRecognizer) {
        print("tappeded")
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.selectedImage = editedImage
        self.selectView.image = editedImage
        
        dismiss(animated: true, completion: nil)
    }
}
