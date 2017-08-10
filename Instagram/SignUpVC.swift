//
//  SignUpVC.swift
//  Instagram
//
//  Created by Ningen Zheng on 09/08/2017.
//  Copyright © 2017 Ningen Zheng. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
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
        
        //
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(notfication:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(notfication:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func showKeyboard(notfication: Notification) -> Void {
        let rect = notfication.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        keyboard = rect.cgRectValue
    }
    func hideKeyboard(notfication: Notification) -> Void {
        
    }
    
    @IBAction func signUpBtn_clicked(_ sender: Any) {
    }
    
    @IBAction func cancelBtn_clicked(_ sender: Any) {
    }
}
