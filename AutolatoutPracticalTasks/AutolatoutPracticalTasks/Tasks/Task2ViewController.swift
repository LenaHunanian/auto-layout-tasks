//
//  Task2.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Build a UI programmatically with a UIButton positioned below a UILabel.
// The button should be centered horizontally and have a fixed distance from the label.
// Adjust the layout to handle different screen sizes.
final class Task2ViewController: UIViewController {
    
    lazy var label : UILabel = {
        $0.text = "Our Label"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .white
        $0.backgroundColor = .systemGray2
        $0.numberOfLines = 0         //added this for label not to clip
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    // our button
    lazy var button : UIButton = {
        $0.setTitle("Our Button", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: buttonTapped))
    
    //just demo action for the button
    lazy var buttonTapped = UIAction { _ in
        print("button tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(button)
        
        //positioning the label with constaints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)])
        //deleted height anchor constraint
        
        
        //positioning the button with constraints
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    
}

#Preview {
    Task2ViewController()
}
