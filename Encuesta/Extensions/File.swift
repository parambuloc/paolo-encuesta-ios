//
//  File.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    class func connectFields(poTextFields: UITextField...) {
        guard let poLastTextField = poTextFields.last else {
            return
        }
        for i in 0 ..< poTextFields.count - 1 {
            poTextFields[i].returnKeyType = .next
            poTextFields[i].addTarget(poTextFields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        poLastTextField.returnKeyType = .done
        poLastTextField.addTarget(poLastTextField, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
}

extension String {
    
    public func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

