//
//  ToDoTableTableViewController.swift
//  ToDoProject
//
//  Created by Freedom on 8/2/22.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
    }

    func createToDos () -> [ToDo] {
        let swift = ToDo ()
        swift.name = "Read a book"
        swift.important = true
        
        let dog = ToDo ()
        dog.name = "Complete homework"
        
        return [swift, dog]
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        //performSegue(withIdentifier: "moveToComplete", sender: toDo)
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
}
