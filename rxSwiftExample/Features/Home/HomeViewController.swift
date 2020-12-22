//
//  HomeViewController.swift
//  rxSwift
//
//  Created by Mahmoud Nasser on 12/8/20.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupBindings()
        homeViewModel.fetchSubjects(page: 1, perPage: 20)
    }
    
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: SubjectCollectionViewCell.identifier,
                                           bundle: nil),
                                     forCellWithReuseIdentifier: SubjectCollectionViewCell.identifier)
        setupCollectionViewLayout()
    }
    
    func setupCollectionViewLayout() {
        let cellWidth = (UIScreen.main.bounds.width - 30 ) / 2
        let cellheight = cellWidth
        let cellSize = CGSize(width: cellWidth,
                              height: cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func setupBindings() {
        
        homeViewModel.loading
            .bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        
        
        homeViewModel
            .subjects
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: SubjectCollectionViewCell.identifier, cellType: SubjectCollectionViewCell.self)) {  (row,subject,cell) in
                cell.subjectModel = subject
            }.disposed(by: disposeBag)
        
        homeViewModel.error.observeOn(MainScheduler.instance).bind { (error) in
            if error.code == 6 {
                self.showError(message: L10n.NetworkError.noInternet)
            }
        }.disposed(by: disposeBag)
    }
    
}
