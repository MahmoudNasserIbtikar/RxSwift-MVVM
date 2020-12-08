//
//  SubjectCollectionViewCell.swift
//  rxSwiftExample
//
//  Created by Mahmoud Nasser on 12/8/20.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var cardView: UIView!

    var subjectModel: SubjectModel? {
        didSet {
            titleLabel.text = subjectModel?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        cardView.setShadow(
            shadowRadius: CGFloat(4),
            xOffset: 0,
            yOffset: 2,
            color: .black,
            opacity: 0.1,
            cornerRadius: CGFloat(8),
            masksToBounds: false)
        
        titleLabel.textAlignment = .center
    }

}
