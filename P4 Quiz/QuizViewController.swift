//
//  QuizViewController.swift
//  P4 Quiz
//
//  Created by g913 DIT UPM on 18/11/2019.
//  Copyright © 2019 g913 DIT UPM. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate {
    
    var quiz: QuizItem!

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var attachmentImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var authorLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz.question
        
        attachmentImageView.image = UIImage(named: "notfound")! //Siempre está
        if let url = quiz.attachment?.url {
            attachmentImageView.image = image(url: url)
        }
        
        photoImageView.image = UIImage(named: "notfound")!
        if let url = quiz.author?.photo?.url {
            photoImageView.image = image(url: url)
        }
        authorLabel.text = quiz.author?.username ?? "Anónimo"
        
        
    }
    
    @IBAction func compruebaReturn(_ sender: UITextField) {
                if sender.text == quiz.answer {
            alert(msg: "¡Respuesta correcta!")
        }
        else {
            alert(msg: "¡Respuesta incorrecta!")
        }
    }
    
    
    @IBAction func comprobar(_ sender: UIButton) {
        if textField.text == quiz.answer {
            alert(msg: "¡Respuesta correcta!")
        }
        else {
            alert(msg: "¡Respuesta incorrecta!")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
