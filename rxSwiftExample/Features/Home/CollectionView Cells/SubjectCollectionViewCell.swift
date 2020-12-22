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
    @IBOutlet weak var subjectImageView: UIImageView!
    
    var subjectModel: SubjectModel? {
        didSet {
            bindData()
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
        
        subjectImageView.layer.cornerRadius = 4
        cardView.backgroundColor = .aliceBlue
        titleLabel.textAlignment = .center
        
    }
    
    private func bindData() {
        
        titleLabel.text = subjectModel?.title
        
        if let consultantPath  = subjectModel?.file?.path{
            let url = URL(string: "https://smea-pc.ibtikar.sa" + consultantPath)
            subjectImageView.sd_setImage(with: url)
        }else{
            subjectImageView.image =  nil
        }
    }
}
