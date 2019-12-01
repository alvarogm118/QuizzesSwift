//
//  ImageStore.swift
//  P4 Quiz
//
//  Created by g913 DIT UPM on 18/11/2019.
//  Copyright © 2019 g913 DIT UPM. All rights reserved.
//

import UIKit

var imageCache = [URL:UIImage]()

func image(url: URL) -> UIImage? {
    
    if let img = imageCache[url] { //Esto es si la imagen está en la caché. Si no está me la descargo en el siguiente if
        return img
    }
    
    if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
        imageCache[url] = img //Mete esta imagen nueva en la caché
        return img
    }
    
    return UIImage(named: "error")! //Si no funciona ningún if pues sale la foto de error que siempre se va a hacer
}

