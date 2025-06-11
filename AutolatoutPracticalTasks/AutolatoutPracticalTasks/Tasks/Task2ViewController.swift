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
        $0.titleLabel?.font = .boldSystemFont(ofSize: 100)        //added this to show that now it works fine
        $0.titleLabel?.lineBreakMode = .byTruncatingTail
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.titleLabel?.minimumScaleFactor = 0.7
        $0.titleLabel?.numberOfLines = 1
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

        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        // Content hugging and compression resistance to prefer intrinsic size but allow shrinking
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        //positioning the label with constaints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)])
        //deleted height anchor constraint
        
        
        //positioning the button with constraints
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //deleted height anchor for button to not clip vertically
            button.leadingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor)
            
        ])
    }
    
    
}

#Preview {
    Task2ViewController()
}
