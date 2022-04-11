//
//  RepositoriesViewModel.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation



protocol RepositriesViewModelType: AnyObject {
    func clearAll()
    func getTotalItem() -> Int
    func getItemFor(_ index:Int) -> Item?
    func fetchRepository(query: String)
}

final class RepositoriesViewModel: RepositriesViewModelType {
    private var items: [Item]? = nil
    private let searchRepository: SearchRepository
    private weak var delegate: UIViewable?
    
    init(searchRepository: SearchRepository = SearchRepositoryImpl(), delegate:UIViewable) {
        self.searchRepository = searchRepository
        self.delegate = delegate
    }
        
    func clearAll(){
        items?.removeAll()
    }
    
    func getTotalItem() -> Int {
        return items?.count ?? 0
    }
    
    func getItemFor(_ index:Int) -> Item? {
        if (index < getTotalItem()) {
            return items![index]
        }
        return nil
    }
    
    func fetchRepository(query: String) {
        delegate?.viewModify(true)
        searchRepository.searchRepository(query: query) { [weak self] result in
            switch result {
                case .success(let repository) :
                    self?.items = repository.items
                    DispatchQueue.main.async {
                        self?.delegate?.refreshUI()
                        self?.delegate?.viewModify(false)
                    }
                case .failure(let error) :
                    self?.items = nil
                    DispatchQueue.main.async {
                        self?.delegate?.viewModify(false)
                        self?.delegate?.showError(error.description)
                    }
            }
        }
    }
}

