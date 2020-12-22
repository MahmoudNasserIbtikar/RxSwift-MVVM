//
//  HomeViewModel.swift
//  rxSwift
//
//  Created by Mahmoud Nasser on 12/8/20.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class HomeViewModel {
    
    public enum HomeError {
        case internetError(NetworkError)
        case serverError(SubjectsResponseModel)
    }
    
    weak var service: HomeWebServiceProtocol?
    
    public let subjects: PublishSubject<[SubjectModel]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<HomeError> = PublishSubject()

    private let disposable = DisposeBag()

    init(service: HomeWebServiceProtocol = HomeWebService.shared) {
        self.service = service
    }
    
    func fetchSubjects(page: Int, perPage: Int) {
        
        guard let service = service else {
            return
        }
        
        
        self.loading.onNext(true)

        service.getSubjects(
            page: page,
            perPage: perPage) { (result) in
            
            self.loading.onNext(false)

            switch result {
            case .success(let response):
                if (response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300 {
                    self.subjects.onNext(response.data ?? [])
                } else {
                    self.error.onNext(.serverError(response))
                }
            case .failure(let error):
                print(error)
                if error.message != "Request explicitly cancelled." {
                    self.error.onNext(.internetError(error))
                }
            }
        }
    }
}
