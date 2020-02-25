//
//  ReusedTextFeild.swift
//  marktApp
//
//  Created by Ahmed on 2/14/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ReusedTextFeild: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var hasValue: Bool{
        guard textFeild.text == "" else{
            containerView.setValidInput()
            return true
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
        containerView.setErrorInput()
        return false
    }
    
    
    let nibName = "ReusedTextFeild"
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    

}
