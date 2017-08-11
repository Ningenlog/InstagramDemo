//
//  SignUpVC.swift
//  Instagram
//
//  Created by Ningen Zheng on 09/08/2017.
//  Copyright © 2017 Ningen Zheng. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var scrollViewHeight: CGFloat = 0
    var keyboard: CGRect = CGRect()
    
    @IBOutlet weak var avaImg: UIImageView!
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeatPasswordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!

    @IBOutlet weak var fullnameTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextField!
    @IBOutlet weak var webTxt: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = self.view.frame.height
        
        //NotificationCenter ...
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(notfication:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(notfication:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        let hideTap = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboardTap(recognizer:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        //
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(loadImg(recognizer:)))
        imgTap.numberOfTapsRequired = 1
        avaImg.isUserInteractionEnabled = true
        avaImg.addGestureRecognizer(imgTap)
        
        //设置头像为圆形
        avaImg.layer.cornerRadius = avaImg.frame.width/2
        avaImg.clipsToBounds = true

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        avaImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadImg(recognizer: UITapGestureRecognizer) -> Void {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func hideKeyboardTap(recognizer: UITapGestureRecognizer) -> Void {
        self.view.endEditing(true)
    }
    
    func showKeyboard(notfication: Notification) -> Void {
        let rect = notfication.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        keyboard = rect.cgRectValue
        UIView.animate(withDuration: 0.4) { 
            self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.size.height
        }
    }
    
    func hideKeyboard(notfication: Notification) -> Void {
        UIView.animate(withDuration: 0.4) { 
            self.scrollView.frame.size.height = self.view.frame.height
        }
    }
    
    @IBAction func signUpBtn_clicked(_ sender: Any) {
    }
    
    @IBAction func cancelBtn_clicked(_ sender: Any) {
    }
}
