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
 //two separate views
    private let redView = UIView()
    private let blueView = UIView()

    // holding constraints separately so we can activate/deactivate on layout updates
    private var verticalConstraints: [NSLayoutConstraint] = []
    private var horizontalConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        updateLayout(for: traitCollection)
        registerForTraitChanges()
    }

    private func setupViews() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue

        view.addSubview(redView)
        view.addSubview(blueView)

        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        // Common constraints for all sides with padding
        let commonRedTop = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let commonLeading = redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let commonTrailing = blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        let commonBottom = blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)

        // Vertical constraints (Compact Width, Regular Height)
        verticalConstraints = [
            commonRedTop,
            commonLeading,
            commonTrailing,
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 15),
            blueView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            commonBottom,
            redView.heightAnchor.constraint(equalTo: blueView.heightAnchor)
        ]

        // Horizontal constraints (Compact Width, Compact Height)
        horizontalConstraints = [
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 15),
            blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)
        ]
    }

    private func updateLayout(for traits: UITraitCollection) {
        // Remove all constraints first
        NSLayoutConstraint.deactivate(verticalConstraints + horizontalConstraints)

        if traits.horizontalSizeClass == .compact {
            if traits.verticalSizeClass == .regular {
                NSLayoutConstraint.activate(verticalConstraints)
            } else if traits.verticalSizeClass == .compact {
                NSLayoutConstraint.activate(horizontalConstraints)
            } else {
                NSLayoutConstraint.activate(verticalConstraints)
            }
        } else {
            NSLayoutConstraint.activate(verticalConstraints) // fallback
        }
    }

    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, _) in
            self.updateLayout(for: self.traitCollection)
        }
    }
}

#Preview {
    Task4ViewController()
}
