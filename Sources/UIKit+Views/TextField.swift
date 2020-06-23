//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 6/4/20.
//

import UIKit

open class TextField: UITextField {
    
    public var padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
}
