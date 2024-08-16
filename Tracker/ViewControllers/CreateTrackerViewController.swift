//
//  CreateTrackerViewController.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import Foundation
import UIKit

protocol CreateTrackerViewControllerDelegate: AnyObject {
    func updateListOfTrackers(newTracker: TrackerCategory)
}

final class CreateTrackerViewController: UIViewController {
    
    private  lazy var habitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .Black
        button.setTitle("Привычка", for: .normal)
        button.tintColor = .White
        button.titleLabel?.textColor = .White
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(habitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private  lazy var irregularEventsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .Black
        button.setTitle("Нерегулярные событие", for: .normal)
        button.tintColor = .White
        button.titleLabel?.textColor = .White
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(irregularEventsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: CreateTrackerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .White
        addElements()
        createNavigationBar()
        setupConstraints()
    }
    
    private func addElements(){
        view.addSubview(habitButton)
        view.addSubview(irregularEventsButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            habitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            habitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            habitButton.heightAnchor.constraint(equalToConstant: 60),
            
            irregularEventsButton.topAnchor.constraint(equalTo: habitButton.bottomAnchor, constant: 16),
            irregularEventsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            irregularEventsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            irregularEventsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            irregularEventsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func createNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.topItem?.title = "Создание трекера"
    }
    
    @objc private func habitButtonTapped() {
        let newHabitVC = NewHabitViewController()
        newHabitVC.eventMode = false
        newHabitVC.delegate = self
        let navVC = UINavigationController(rootViewController: newHabitVC)
        present(navVC, animated: true)
    }
    
    @objc private func irregularEventsButtonTapped() {
        let newHabitVC = NewHabitViewController()
        newHabitVC.eventMode = true
        newHabitVC.delegate = self
        let navVC = UINavigationController(rootViewController: newHabitVC)
        present(navVC, animated: true)
    }
}

extension CreateTrackerViewController: NewHabitViewControllerDelegate {
    func addNewTracker(newTracker: TrackerCategory) {
        delegate?.updateListOfTrackers(newTracker: newTracker)
        if let navController = self.navigationController {
            navController.dismiss(animated: true, completion: nil)
            dismiss(animated: true, completion: nil)
        }
    }
}

