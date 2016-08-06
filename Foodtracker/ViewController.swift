//
//  ViewController.swift
//  Foodtracker
//
//  Created by Enrique Ortiz on 8/4/16.
//  Copyright © 2016 Enrique Ortiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    
    /*NOTE: @IBoutlet means that this is an object from the UI, weak means that it can have no value at somepoint, rest is housekeeping swift*/
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self refers to viewController.swift
        //Handle text field input through delegate callback.
        
        nameTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        //This function dismisses the keyboard (resignfirstresponder) and returns true, the boolean value says DO respond to the user pressing return
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
      
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //dismiss the picker if user did cancel.
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //set PhotoImageView to show the selected image
        photoImageView.image = selectedImage
        
        //Dismiss the image picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        //only allows to be picked, not taken:
        imagePickerController.sourceType = .PhotoLibrary
        
        //make sure the ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
         presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    /*NOTE: @IBaction means that this is a action method which you have connected from the storyboard to the viewController*/
    
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
            
        
    }
}

/*NOTES:
 Delegate: Object that acts on behalf of, or in coordination with, another object. The Delegating object-in this case, the text field-keeps a reference to the object-the delegate-and at the appropiate time, the delegating object sends a message to the delegate. This messages tells the delegate about an event that has ocurred.
 */