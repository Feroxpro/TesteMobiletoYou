//
//  blurEffect+UIView.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addBlurToView() {
        let blurEffect: UIBlurEffect
        blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.alpha = 0.06
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
