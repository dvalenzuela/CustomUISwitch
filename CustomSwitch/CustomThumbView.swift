//
//  CustomThumbView.swift
//  CustomSwitch
//
//  Created by Aleksandar Atanackovic on 12/20/16.
//  Copyright © 2016 Ivan Kovacevic. All rights reserved.
//

import UIKit

final class CustomThumbView: UIView {

    fileprivate(set) var thumbImageView = UIImageView(frame: CGRect.zero)

    public var borderColor: UIColor = UIColor.clear
    public var borderWidth: CGFloat = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.thumbImageView)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(self.thumbImageView)

    }
}

extension CustomThumbView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.thumbImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.thumbImageView.layer.cornerRadius = self.layer.cornerRadius
        self.thumbImageView.clipsToBounds = self.clipsToBounds
        self.thumbImageView.contentMode = .center
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor

    }

}
import Foundation
import UIKit
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
