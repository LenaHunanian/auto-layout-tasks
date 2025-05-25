//
//  Task3ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit
import Combine

// Lay out login screen as in the attached screen recording.
// 1. Content should respect safe area guides
// 2. Content should be visible on all screen sizes
// 3. Content should be spaced on bottom as in the recording
// 4. When keyboard appears, content should move up
// 5. When you tap the screen and keyboard gets dismissed, content should move down
// 6. You can use container views/layout guides or any option you find useful
// 7. Content should have horizontal spacing of 16
// 8. Title and description labels should have a vertical spacing of 12 from each other
// 9. Textfields should have a spacing of 40 from top labels
// 10. Login button should have 16 spacing from textfields
final class Task3ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let logInButton = UIButton()
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupGestures()
        
        
    }
    
    private func setupGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    private func setupView() {
        setupLabels()
        setupTextFields()
        setupButton()
        setupConstraints()
        
    }
    
    private func setupLabels() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        bodyLabel.numberOfLines = 3
        bodyLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore
        """
        
        //added labels to contentView
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
    }
    
    private func setupTextFields() {
        usernameField.placeholder = "Enter username"
        passwordField.placeholder = "Enter password"
        usernameField.borderStyle = .roundedRect
        passwordField.borderStyle = .roundedRect
        
        //added textfields to contentView
        contentView.addSubview(usernameField)
        contentView.addSubview(passwordField)
    }
    
    private func setupButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.tintColor, for: .normal)
        
        //added the button to contentView
        contentView.addSubview(logInButton)
    }
    
    //MARK: Setting Up Constraints
    private func setupConstraints() {
        contentViewConstraints()
        labelsConstraints()
        textfieldsConstraints()
        buttonConstraints()
    }
    
    
    
    //----contentView constaints --------
    private func contentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor)
        ])
    }
    
    //----------labels constraints -----------
    private func labelsConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
    }
    
    //---------textfields constraints ------------
    private func textfieldsConstraints() {
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 40),
            usernameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            usernameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
    }
    
    //-----------button constraints ---------
    private func buttonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
}

#Preview {
    Task3ViewController()
}
