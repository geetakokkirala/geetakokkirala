//
//  UIHelpers.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import UIKit

extension UILabel {

    func title() -> Self {
        self.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: nil)
        self.textColor = .black
        return self
    }

    func body() -> Self {
        self.font = UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: nil)
        self.textColor = .black
        return self
    }

}
