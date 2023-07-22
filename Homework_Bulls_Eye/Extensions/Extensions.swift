//
//  AlertController.swift
//  Homework_Bulls_Eye
//
//  Created by Dmitriy Mkrtumyan on 12.07.23.
//

import Foundation
import UIKit

extension ViewController {
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Return", style: .cancel)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}
    

