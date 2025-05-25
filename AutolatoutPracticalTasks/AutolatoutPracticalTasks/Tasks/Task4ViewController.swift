//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    //red and blue views, and stackview
    private let redView = UIView()
    private let blueView = UIView()
    private let stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        updateLayout(for: traitCollection)
        registerForTraitChanges()
    }
    
    
    //MARK: setting up views
    private func setupViews() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        
        
        view.addSubview(stackView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    //MARK: constraints for stackView
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    //MARK: updating the layout following the screen rotating position
    private func updateLayout(for traits: UITraitCollection) {
        if traits.horizontalSizeClass == .compact {
            if traits.verticalSizeClass == .regular {
                stackView.axis = .vertical
            }else if traits.verticalSizeClass == .compact {
                stackView.axis = .horizontal
            }else {
                stackView.axis = .vertical
            }
        }
    }
    
    
    
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            // TODO: -  Handle the trait change.
            print("Trait collection changed:", self.traitCollection)
            
            //added this method to handle the trait change
            self.updateLayout(for: self.traitCollection)
        }
    }
}

#Preview {
    Task4ViewController()
}
