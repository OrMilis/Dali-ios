//
//  File.swift
//  Dali-ios
//
//  Created by Or Milis on 23/07/2019.
//  Copyright © 2019 Or Milis. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFromUrl(urlString: String) {
        RestController.getPictureFromURL(urlString: urlString, completion: { (res) in
            switch res {
            case .success(let genData):
                guard let image = UIImage(data: genData) else { return }
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure(let err):
                print(err)
            }
        })
    }
    
    func setRoundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
