//
//  MyLoginView.swift
//  MyFramework
//
//  Created by Unicorn IT on 24.02.16.
//  Copyright © 2016 com.my.framework. All rights reserved.
//

import UIKit

public class MyLoginView: UIView {

    var view: UIView!
    
    var nibName: String = "MyLoginView"
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    public var loginHandler:((username: String, password: String) -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @IBAction func login(sender: AnyObject) {
        
        if(loginHandler == nil) {
            print("No loginHandler defined")
            return
        }
        
        loginHandler!(
            username: usernameTextfield.text!,
            password: passwordTextfield.text!)
        
    }
    
    func setup() {
        
        self.view = UINib(nibName: nibName, bundle: NSBundle(forClass: self.dynamicType)).instantiateWithOwner(self, options: nil)[0] as! UIView
        
        self.view.frame = bounds
        self.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        self.addSubview(self.view)
    }

}
