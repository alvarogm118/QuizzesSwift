//
//  Alert.swift
//  P4 Quiz
//
//  Created by g913 DIT UPM on 18/11/2019.
//  Copyright © 2019 g913 DIT UPM. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(msg: String, completionHandler: (() -> ())? = nil) {
        print("Alerta: \(msg)")
        
        let avc = UIAlertController(title: "Resultado", message: msg, preferredStyle: .alert)
        
        avc.addAction(UIAlertAction(title: "OK", style: .default) {
            (action) in completionHandler?()
        })
        present(avc, animated: true)
    }
}


