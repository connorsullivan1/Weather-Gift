//
//  UIViewController+alert.swift
//  ToDoList
//
//  Created by Connor on 3/4/20.
//  Copyright © 2020 Connor Sullivan. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func oneButtonAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alertController.addAction(defaultAction)
          self.present(alertController, animated: true, completion: nil)
    }
    
}
