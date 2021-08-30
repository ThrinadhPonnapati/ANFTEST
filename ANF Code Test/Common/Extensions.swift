//
//  Extensions.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/29/21.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

