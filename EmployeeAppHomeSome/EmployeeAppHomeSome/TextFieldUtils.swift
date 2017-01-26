//
//  TextFieldUtils.swift
//  Sydne
//
//  Created by Rahul Chabukswar on 7/15/15.
//  Copyright (c) 2015 Phontabulous, Inc. All rights reserved.
//

import Foundation
import UIKit

class TextFieldUtils {
    
    class func configureTextField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        // no capitalization, correction or spell check
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.spellCheckingType = UITextSpellCheckingType.no
        
        // background color is white and text is black
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        textField.font = UIFont.systemFont(ofSize: 14)
        
        textField.keyboardType = UIKeyboardType.default
    }
    
    class func configureEmailTextField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.keyboardType = UIKeyboardType.emailAddress
    }
    
    class func configurePasswordTextField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.isSecureTextEntry = true
    }
    
    class func configureNumberTextField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.keyboardType = UIKeyboardType.numberPad
    }
    
    class func configureNameTextField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.autocapitalizationType = UITextAutocapitalizationType.words
    }
    
    class func configurePlaceholder(textField: UITextField!, text: String!) {
        
        if (textField == nil || text == nil) {
            return
        }
        
        textField.placeholder = text
    }
    
    class func configureAllCapsField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
    }
    
    class func configurePascalCasedAutoCorrectionField(textField: UITextField!) {
        
        if (textField == nil) {
            return
        }
        
        TextFieldUtils.configureTextField(textField: textField)
        
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.autocorrectionType = UITextAutocorrectionType.yes
        textField.spellCheckingType = UITextSpellCheckingType.yes
    }
    
}
