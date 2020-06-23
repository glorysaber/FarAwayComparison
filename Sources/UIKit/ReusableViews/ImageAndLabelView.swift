//
//  ImageAndLabelView.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 6/23/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import UIKit

@IBDesignable
class ImageAndLabelView: UIView {

	private lazy var containerStackView: UIStackView = {
		let containerStackView = UIStackView()
		containerStackView.translatesAutoresizingMaskIntoConstraints = false
		containerStackView.axis = .horizontal
		return containerStackView
	}()

	@objc private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(systemName: "thermometer")
		imageView.tintColor = .white
		imageView.contentMode = .scaleAspectFit

		return imageView
	}()

	lazy private var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Nil"
		label.textColor = .white
		return label
	}()

	private var imageViewHeightConstraint: NSLayoutConstraint?
	private var observation: NSKeyValueObservation?


	required init?(coder: NSCoder) {
		super.init(coder: coder)
		guard let containerStackView = coder.decodeObject(forKey: "StackView") as? UIStackView else {
			return nil
		}

		self.containerStackView = containerStackView

		guard let imageView = containerStackView.arrangedSubviews.first as? UIImageView else {
			return nil
		}

		guard let labelView = containerStackView.arrangedSubviews.last as? UILabel else {
			return nil
		}

		self.imageView = imageView
		label = labelView

		guard let constraint = imageView.constraints.first else {
			return nil
		}

		imageViewHeightConstraint = constraint

		addObservationToImage()
	}

	override func encode(with coder: NSCoder) {
		coder.encode(containerStackView, forKey: "StackView")
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}

	private func setupViews() {
		clipsToBounds = true
		backgroundColor = .clear
		addSubview(containerStackView)
		containerStackView.addArrangedSubview(imageView)
		containerStackView.addArrangedSubview(label)
		layoutViews()
	}

	fileprivate func addObservationToImage() {
		observation = observe(\.imageView.image) { [weak self] (object, change) in
			guard let image = change.newValue as? UIImage else {
				return
			}
			self?.changeimageRatioConstraint(height: image.size.height, width: image.size.width)
		}
	}

	private func layoutViews() {
		// Stack View
		NSLayoutConstraint.activate(
			[containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			 containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			 containerStackView.topAnchor.constraint(equalTo: topAnchor),
			 containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
			 ])

		

		// Image view layout
		imageView.setContentHuggingPriority(.required, for: .horizontal)
		imageView.setContentHuggingPriority(.init(0), for: .vertical)

		if let image = imageView.image {
			changeimageRatioConstraint(height: image.size.height, width: image.size.width)
		}

		// Stack View contents layout
		containerStackView.spacing = 8
		containerStackView.distribution = .fill
		containerStackView.alignment = .fill

		addObservationToImage()
	}

	override class func prepareForInterfaceBuilder() {}

	func changeimageRatioConstraint(height: CGFloat, width: CGFloat) {
		if let imageViewHeightConstraint = imageViewHeightConstraint {
			imageView.removeConstraint(imageViewHeightConstraint)
		}
		
		imageViewHeightConstraint = {
			// Constraint to make sure UIImageView is same ratio as its image
			let imageViewHeightConstraint = NSLayoutConstraint(
				item: imageView,
				attribute: .height,
				relatedBy: .equal,
				toItem: imageView,
				attribute: .width,
				multiplier: height / width,
				constant: 0)

			// Lowering priority to allow other cosntraints to take priority
			imageViewHeightConstraint.priority = .required - 1
			imageView.addConstraint(imageViewHeightConstraint)
			return imageViewHeightConstraint
		}()
	}
}

extension ImageAndLabelView {
	@IBInspectable var image: UIImage? {
		get {
			imageView.image
		}
		set {
			imageView.image = newValue
		}
	}

	@IBInspectable var text: String? {
		get {
			label.text
		}
		set {
			label.text = newValue
		}
	}
}
