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

		setupViews()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}

	private func setupViews() {
		clipsToBounds = true
		backgroundColor = .clear
		addSubview(imageView)
		addSubview(label)
		layoutViews()
	}


	private func layoutViews() {
		// textView

		NSLayoutConstraint.activate(
			[label.trailingAnchor.constraint(equalTo: trailingAnchor),
			 label.topAnchor.constraint(equalTo: topAnchor),
			 label.bottomAnchor.constraint(equalTo: bottomAnchor),
			 label.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 0)
		])

		label.setContentHuggingPriority(.required, for: .horizontal)

		// Image view layout
		imageView.setContentHuggingPriority(.required, for: .horizontal)
		imageView.setContentHuggingPriority(.init(0), for: .vertical)

		NSLayoutConstraint.activate(
			[imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			 imageView.topAnchor.constraint(equalTo: topAnchor),
			 imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])


		if let image = imageView.image {
			changeimageRatioConstraint(height: image.size.height, width: image.size.width)
		}

		addObservationToImage()
	}

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
//			imageViewHeightConstraint.priority = .required - 1
			imageView.addConstraint(imageViewHeightConstraint)
			return imageViewHeightConstraint
		}()
	}

	fileprivate func addObservationToImage() {
		observation = observe(\.imageView.image) { [weak self] (object, change) in
			guard let image = change.newValue as? UIImage else {
				return
			}
			self?.changeimageRatioConstraint(height: image.size.height, width: image.size.width)
		}
	}

	override class func prepareForInterfaceBuilder() {}

	override var intrinsicContentSize: CGSize {
		return {
			CGSize(width: label.intrinsicContentSize.width + (imageView.image?.size.width ?? imageView.intrinsicContentSize.width) + 24,
						 height: label.intrinsicContentSize.height + (imageView.image?.size.height ?? imageView.intrinsicContentSize.height))
		}()
	}
}

extension ImageAndLabelView {
	@IBInspectable var image: UIImage? {
		get {
			imageView.image
		}
		set {
			defer {
				invalidateIntrinsicContentSize()
			}
			imageView.image = newValue
		}
	}

	@IBInspectable var text: String? {
		get {
			label.text
		}
		set {
			defer {
				invalidateIntrinsicContentSize()
			}
			label.text = newValue
		}
	}
}
