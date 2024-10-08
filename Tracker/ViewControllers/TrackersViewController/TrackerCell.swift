//
//  TrackerCell.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import Foundation
import UIKit

protocol TrackerCellDelegate:AnyObject {
    func completeTracker(id: UUID, at indexPath: IndexPath)
}

final class TrackerCell: UICollectionViewCell {
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Уборка"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white.withAlphaComponent(0.3)
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        let pointSize = UIImage.SymbolConfiguration(pointSize: 11)
        let image = UIImage(systemName: "plus", withConfiguration: pointSize)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 17
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let plusImage: UIImage = {
        let pointSize = UIImage.SymbolConfiguration(pointSize: 11)
        let image = UIImage(systemName: "plus", withConfiguration: pointSize)
        return image ?? UIImage()
    }()
    
    private let doneImage = UIImage(named: "doneImage")
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "0 дней"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var isCompletedToday: Bool = false
    private var trackerId: UUID?
    private var indexPath: IndexPath?
    
    weak var delegate: TrackerCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with tracker: Tracker, isCompletedToday: Bool, completedDays: Int, indexPath: IndexPath) {
        self.trackerId = tracker.id
        self.isCompletedToday = isCompletedToday
        self.indexPath = indexPath
        
        mainView.backgroundColor = tracker.color
        plusButton.backgroundColor = tracker.color
        
        taskTitleLabel.text = tracker.name
        emojiLabel.text = tracker.emoji
        
        let image = isCompletedToday ? doneImage : plusImage
        plusButton.setImage(image, for: .normal)
        
        counterLabel.text = completedDays.days()
    }
    
    private func addElements() {
        contentView.addSubview(mainView)
        contentView.addSubview(taskTitleLabel)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(plusButton)
        contentView.addSubview(counterLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 90),
            
            taskTitleLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12),
            taskTitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            taskTitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),
            
            emojiLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            emojiLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            emojiLabel.widthAnchor.constraint(equalToConstant: 24),
            emojiLabel.heightAnchor.constraint(equalToConstant: 24),
            
            plusButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 8),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            plusButton.widthAnchor.constraint(equalToConstant: 34),
            plusButton.heightAnchor.constraint(equalToConstant: 34),
            
            counterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            counterLabel.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 16),
            counterLabel.widthAnchor.constraint(equalToConstant: 101),
            counterLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    @objc private func plusButtonTapped() {
        guard let trackerId = trackerId,
              let indexPath = indexPath
        else {
            assertionFailure("No trackerId")
            return
        }
        delegate?.completeTracker(id: trackerId, at: indexPath)
    }
}
