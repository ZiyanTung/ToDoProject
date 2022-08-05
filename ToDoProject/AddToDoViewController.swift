//
//  AddToDoViewController.swift
//  ToDoProject
//
//  Created by Freedom on 8/4/22.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: Any) {
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source

 

}
