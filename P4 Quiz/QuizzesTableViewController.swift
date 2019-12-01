//
//  QuizzesTableViewController.swift
//  P4 Quiz
//
//  Created by g913 DIT UPM on 18/11/2019.
//  Copyright © 2019 g913 DIT UPM. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {

    var quiz10Model = Quiz10Model()
    
    override func viewDidLoad() { //Este metodo lo carga al principio de la ejecucion
        super.viewDidLoad()

        quiz10Model.download()
        tableView.reloadData()
    }

    
    @IBSegueAction func showQuizDetails(_ coder: NSCoder) -> QuizViewController? {
        
        let qvc = QuizViewController(coder: coder)
        
        let row = tableView.indexPathForSelectedRow!.row
        
        qvc?.quiz = quiz10Model.quizzes[row]
        
        return qvc
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz10Model.quizzes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz Cell", for: indexPath) as! QuizCell

        let row = indexPath.row
        let quiz = quiz10Model.quizzes[row]
        
        cell.qLabel.text = quiz.question
        cell.aLabel.text = quiz.author?.username ?? "Anónimo" //El ?? es si no existe el opcional primero
        cell.imgView.image = UIImage(named: "notfound")
        
        if let url = quiz.attachment?.url {
            cell.imgView?.image = UIImage(named: "download")
            let img = image(url: url) // El image(...) es la funcion que está en ImageStore
            cell.imgView?.image = img //La condicion de arriba son 2 separadas con una coma, o eso creemos
        }
        
        return cell
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        quiz10Model.download()
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
