//
//  Task1ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

/// UILabel is not visible even though constraints are set. Fix the issue.
final class Task1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Label here"
        label.backgroundColor = .white
        
        //Because our label is set up with contraits, we need to disable Autoresizing masks, thats why it was not visible
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
}

#Preview {
    Task1ViewController()
}
