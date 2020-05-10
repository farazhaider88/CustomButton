//
//  ButtonPrimary.swift
//  EtisalatUAE
//
//  Created by Faraz Haider on 10/05/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation

class ButtonPrimary: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setEnabled(true)
        setSelected(selected: false)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setEnabled(true)
        setSelected(selected: false)
    }
    
    func commonInit() {
        layer.cornerRadius = cornerRadius
        backgroundColor = UIColor.clear
        tintColor = UIColor.clear
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.cornerRadius = 8
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setEnabled(_ enabled: Bool) {
        isEnabled = enabled
        commonInit()
        setEnableState(enabled)
    }
    
    open override func didMoveToWindow() {
        setTitle(title(for: .normal)?.uppercased(), for: .normal)
    }
    
    func setEnableState(_ enabled: Bool) {
        isEnabled = enabled
        if enabled {
            backgroundColor = UIColor(red: 113.0 / 255.0, green: 158.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
            layer.shadowColor = UIColor(red: 0.44, green: 0.62, blue: 0.1, alpha: 0.5).cgColor
            titleLabel?.textColor = UIColor.white
            isUserInteractionEnabled = true
            
            var spacing: Float = 0.0
            if LanguageHandler.sharedObject().selectedLanguage == EnglishLanguage {
                spacing = 2.4
            }
            
            var buttonTitle = accessibilityHint?.localized ?? titleLabel?.text?.localized
            
            if let buttonTitle = buttonTitle, buttonTitle.count > 0{
                
                let attributedString = NSMutableAttributedString(string: buttonTitle.uppercased())
                attributedString.addAttribute(
                    .kern,
                    value: NSNumber(value: spacing),
                    range: NSRange(location: 0, length: buttonTitle.count))
                setAttributedTitle(attributedString, for: .normal)
            }else{
                  buttonTitle = title(for: .normal) ?? ""
            }
            
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: 48).isActive = true
            
        } else {

            backgroundColor = UIColor(hexString:"#D1D2D1")
            titleLabel?.textColor = UIColor(hexString:"#848789")
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            isUserInteractionEnabled = false
            
            var spacing: Float = 0.0
            if LanguageHandler.sharedObject().selectedLanguage == EnglishLanguage {
                spacing = 2.4
            }
            
            var buttonTitle = accessibilityHint?.localized ?? titleLabel?.text?.localized
            
            if let buttonTitle = buttonTitle, buttonTitle.count > 0{
                let attributedString = NSMutableAttributedString(string: buttonTitle.uppercased())
                attributedString.addAttribute(
                    .kern,
                    value: NSNumber(value: spacing),
                    range: NSRange(location: 0, length: buttonTitle.count))
                setAttributedTitle(attributedString, for: .normal)
            }else{
                buttonTitle = title(for: .normal) ?? ""
            }
            
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
    }

    func setSelected(selected: Bool) {
        commonInit()
        if selected{
            backgroundColor = UIColor.clear
            titleLabel?.textColor = UIColor(hexString: "#353738")
            layer.borderColor = UIColor(hexString: "#353738").cgColor
            layer.cornerRadius = 8
            layer.borderWidth = 1
            
            
            var spacing: Float = 0.0
            if LanguageHandler.sharedObject().selectedLanguage == EnglishLanguage {
                spacing = 2.4
            }
            var buttonTitle = accessibilityHint?.localized ?? titleLabel?.text?.localized
            
            if let buttonTitle = buttonTitle, buttonTitle.count > 0{
                let attributedString = NSMutableAttributedString(string: buttonTitle.uppercased())
                attributedString.addAttribute(
                    .kern,
                    value: NSNumber(value: spacing),
                    range: NSRange(location: 0, length: buttonTitle.count))
                setAttributedTitle(attributedString, for: .normal)
            }else{
                buttonTitle = title(for: .normal) ?? ""
            }
            
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        
        
    }
    
    
}

